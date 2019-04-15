class MainController < ApplicationController
  def home
    today = Date.today
    week = today.beginning_of_week
    @tabs = {
      today: {
        label: 'Today',
        component: 'Today',
        props: {
          dos: ['morning prayer', 'anchor checkin'],
          donts: ['mortal sin'],
          reading: Reading.where(date: today).first,
        }
      },
      week: {
        label: 'This week',
        component: 'Week',
        props: {
          days: days_for(week),
          week: week
        }
      },
      calendar: {
        label: 'Calendar',
        component: 'Today',
        props: {
          dos: ['morning prayer'],
          donts: ['fapping'],
          reading: 'blah blah blah',
        }
      },
      edit: {
        label: 'Edit content',
        component: 'Edit',
        props: {
          today: today,
          details: day_details(today),
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
