# encoding:utf-8 
module TimerosterLineHelper
  #将来リンク対応予定
  def month_text(month_date)
    I18n.localize(month_date, :format => "%Y年 %B月")
  end

  #オプション指定
  def caltable_args
    {
      :year => @year,
      :month => @month,
      :month_name_text => month_text(@shown_month),
      :previous_month_text => "<<" + month_text(@shown_month.prev_month) ,
      :next_month_text => month_text(@shown_month.next_month) + ">>"
    }
  end

  # 呼出
  def time_caltable
    caltable caltable_args

  end

  #Write Table HTML
  def caltable(options = {})
    defaults ={
      :show_month_header => true,
      :year => (Time.zone || Time).now.year,
      :month => (Time.zone || Time).now.month,
      :month_name_text => month_text((Time.zone || Time).now),
      :previous_month_text => month_text((Time.zone || Time).now.prev_month),
      :next_month_text => month_text((Time.zone || Time).now.next_month),
      #:month_name_text => (Time.zone || Time).now.strftime("%B %Y"),
      #:previous_month_text => nil,
      #:next_month_text => nil
    }
    options = defaults.merge options
 
    # 曜日取得
    # create the day names array [Sunday, Monday, etc...]
    day_names = []
    day_names.concat(I18n.translate(:'date.abbr_day_names'))
 
    # Build the HTML string
    cal = ""
    
    # outer calendar container
    cal << %(<div id="et-table">)
    # month header add
    if options[:show_month_header]
      cal << %(<table class="et-calendar-month-header table ct-calendar" cellpadding="0" cellspacing="0">)
      cal << %(<tbody><tr>)
      cal << %(<td colspan="2" class="ct-month-nav ct-previous-month">#{options[:previous_month_text]}</td>)
      cal << %(<td colspan="6" class="ct-month-name">#{options[:month_name_text]}</td>)
      cal << %(<td colspan="2" class="ct-month-nav ct-next-month">#{options[:next_month_text]}</td>)
      cal << %(</tr></tbody></table>)
    end
    # body container header
    cal << %(<table id="et-calendar" class="table table-bordered dataTable" cellpadding="0" cellspacing="0">)
    cal << %(<thead><tr><th class="ct-working_date-header">)
    cal << %(日付)
    cal << %(</th>)
    cal << %(<th colspan="3" class="ct-wroking_time-header">)
    cal << %(就業時間)
    cal << %(</th>)
    cal << %(<th>)
    cal << %(実働)
    cal << %(</th>)
    cal << %(<th>)
    cal << %(欠時)
    cal << %(</th>)
    cal << %(<th>)
    cal << %(普通深)
    cal << %(</th>)
    cal << %(<th>)
    cal << %(休日出)
    cal << %(</th>)
    cal << %(<th>)
    cal << %(休日深)
    cal << %(</th>)
    cal << %(<th>)
    cal << %(備考)
    cal << %(</th>)
    cal << %(</tr></thead>)
    # body container
    # initialize
    first = Date.civil(options[:year], options[:month], 1).strftime("%d").to_i
    last = Date.civil(options[:year], options[:month], -1).strftime("%d").to_i
    day_of_the_week = 0
    cal << %(<tbody>)
    # day loop
    first.step(last).each do |days| 
      day_of_the_week = Date.civil(options[:year],options[:month],days).wday
      range = Date.civil(options[:year],options[:month],days)
      day_going_time = TimeRoster.where(:work_date => range) 
      cal << %(<tr style=")
      if day_of_the_week == 0
        cal << %(background-color: rgb(254,153,204); color: red; )
      elsif day_of_the_week == 6
        cal << %(background-color: rgb(204,255,255); color: blue; )
      end
      cal << %(" >)
      cal << %(<td class="et-days" style="text-align: center;">)
      cal << %(#{days}日(#{day_names[day_of_the_week]}))
      cal << %(</td>)
      cal << %(<td class="et-going-work-table">)
      unless day_going_time[0] == nil
        cal << %(#{day_going_time[0].going_work_time.strftime("%H:%M")})
      end 
      cal << %(</td>)
      cal << %(<td class="et-tilda">)
      cal << %(〜)
      cal << %(</td>)
      cal << %(<td class="et-quit-work-time">)
      unless day_going_time[0] == nil
        cal << %(#{day_going_time[0].quit_work_time.strftime("%H:%M")})
      end
      cal << %(</td>)
      cal << %(<td>)
      unless day_going_time[0] == nil
        jitudo_time = (day_going_time[0].quit_work_time - day_going_time[0].going_work_time) / 3600
        cal << %(#{jitudo_time.round(1)})
      end
      cal << %(</td>)
      cal << %(<td>)
      cal << %()
      cal << %(</td>)
      cal << %(<td>)
      cal << %()
      cal << %(</td>)
      cal << %(<td>)
      cal << %()
      cal << %(</td>)
      cal << %(<td>)
      cal << %()
      cal << %(</td>)
      cal << %(<td>)
      cal << %()
      cal << %(</td>)
      cal << %(</tr>)
    end
    cal << %(</tbody>)
    cal << %(</table>)
    cal << %(</div>)
  end 
end
