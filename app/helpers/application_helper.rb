include ActionView::Helpers::TextHelper
include ActionView::Context
module ApplicationHelper
  def format_date date
    # %a - The abbreviated weekday name (''Sun'')
    # %A - The  full  weekday  name (''Sunday'')
    # %b - The abbreviated month name (''Jan'')
    # %B - The  full  month  name (''January'')
    # %c - The preferred local date and time representation
    # %d - Day of the month (01..31)
    # %H - Hour of the day, 24-hour clock (00..23)
    # %I - Hour of the day, 12-hour clock (01..12)
    # %j - Day of the year (001..366)
    # %m - Month of the year (01..12)
    # %M - Minute of the hour (00..59)
    # %p - Meridian indicator (''AM'' or ''PM'')
    # %S - Second of the minute (00..60)
    # %U - Week  number  of the current year,
    #      starting with the first Sunday as the first
    #      day of the first week (00..53)
    # %W - Week  number  of the current year,
    #      starting with the first Monday as the first
    #      day of the first week (00..53)
    # %w - Day of the week (Sunday is 0, 0..6)
    # %x - Preferred representation for the date alone, no time
    # %X - Preferred representation for the time alone, no date
    # %y - Year without a century (00..99)
    # %Y - Year with century
    # %Z - Time zone name
    # %% - Literal ''%'' character
    date.strftime "%d/%m/%Y" rescue ""
  end
  
  def to_money number
    number_to_currency number, :unit => 'R$', :delimiter => '.', :separator => ','
  end
  
  def form_input form, model, field, &block
    content_tag(:div, :class => "control-group#{ model.errors.include?(field) ? " error" : ""}") {
      concat form.label(field, :class => "control-label")
      concat content_tag(:div, :class => "controls") {
        concat capture(&block)
        concat field_error_help(model, field)
      }
    }
  end
  
  def form_submit form, &block
    content_tag(:div, :class => "control-group") {
      concat content_tag(:div, :class => "controls") {
        concat block_given? ? capture(&block) : form.submit(:class => "btn btn-primary")
      }
    }
  end
  
  def form_errors_block model
    if model.errors.any?
      content_tag(:div, :class => "alert alert-error") {
        concat content_tag(:i, :class => "icon-exclamation-sign") { }
        concat content_tag(:strong) { " Please correct the following #{ model.errors.count > 1 ? "errors" : "error" } in order to proceed:".html_safe }
        concat content_tag(:ul) {
          model.errors.full_messages.each do |message|
            concat content_tag(:li) { "#{message}".html_safe }      
          end     
        }
      }
    end
  end
  
  def field_error_help model, field
    if model.errors.include? field
      content_tag(:span, :class => "help-inline") {
        "#{model.class.human_attribute_name field} #{model.errors[field].to_sentence(:last_word_connector => ' and ')}".html_safe
      }
    end
  end
  
  def datepicker_field model, field
    content_tag(:div, :class => "input-prepend input-append") {
      concat content_tag(:span, :class => "add-on") {
        concat content_tag(:i, :class => "icon-calendar") { }
      }
      concat content_tag(:input, 
        :id              => "#{model.class.to_s.downcase}_#{field.to_s}", 
        :name            => "#{model.class.to_s.downcase}[#{field.to_s}]",
        :type            => "text",
        'data-behaviour' => 'datepicker',
        :value           => "#{ format_date model[field] }") { }
    }
  end
end
