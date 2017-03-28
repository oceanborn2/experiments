module Classes 
begin

    type Class{K} begin
       # abstract function init(args...) e
    end

end

using Classes

t = Class{Int128}