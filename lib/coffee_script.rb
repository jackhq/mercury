module Haml::Filters::CoffeeScript
  include Haml::Filters::Base

  def render(text)
    %Q{
<script type="text/coffeescript">
  #{text.chomp}
</script>
}
  end
      
      
end
