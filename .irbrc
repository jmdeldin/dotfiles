require 'irb/completion'

{
  'wirb'      => ->{ Wirb.start },     # colorize output
  'fancy_irb' => ->{ FancyIrb.start }, # result as comment
}.each do |gem, cmd|
  begin
    require gem
    cmd.()
  rescue LoadError
  end
end

