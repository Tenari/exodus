class MainController < ApplicationController
  def home
    today = Date.today
    today_details = day_details(today)
    week = today.beginning_of_week
    @tabs = {
      today: {
        label: 'Today',
        component: 'Today',
        props: today_details,
      },
      week: {
        label: 'This week',
        component: 'Week',
        props: {
          days: days_for(week),
          week: week
        }
      },
      edit: {
        label: 'Edit content',
        component: 'Edit',
        props: {
          today: today,
          details: today_details,
          ascetic_practices: AsceticPractice.all.to_a,
        }
      },
    }
  end

  # all the info for a particular date, in json form
  def details
    current = Date.parse(params[:date])
    return render json: day_details(current)
  end

  def update_reading
    date = Date.parse(params[:date])
    reading = Reading.where(date: date).first_or_create
    reading.update(text: params[:text])
    return render json: {status: :ok}
  end

  def update_ascetic_plans
    AsceticPlan.where(date: params[:date]).destroy_all
    if params[:ids]
      params[:ids].each do |id|
        AsceticPlan.create(ascetic_practice_id: id, date: params[:date])
      end
    end
  end

  private

    def days_for(week_start)
      results = []
      7.times do |i|
        current = week_start + i
        results.push(day_details(current))
      end
      results
    end

    def day_details(date)
      reading = Reading.where(date: date).first
      asceticisms = AsceticPlan.where(date: date).map do |ap|
        ap.ascetic_practice.description
      end
      {
        date: date,
        reading: reading && reading.text,
        practices: asceticisms,
        practice_ids: AsceticPlan.where(date: date).map(&:ascetic_practice_id).uniq,
      }
    end
end
