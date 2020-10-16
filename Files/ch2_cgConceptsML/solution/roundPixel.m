function val = roundPixel(val) %#codegen
    % Copyright 2018 The MathWorks, Inc.
    coder.inline('never')
    val = round(val);

end