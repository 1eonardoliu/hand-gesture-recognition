function Threshold
fig = uifigure('Position',[100 100 350 275]);
 assignin('base', 'TH1', 0.1);%H low
 assignin('base', 'TH2', 0.9);%H high
 assignin('base', 'TS1', 0.1);%S low
 assignin('base', 'TS2', 0.9);%S high
sld1 = uislider(fig,...
    'Position',[100 200 120 3],...
    'Limit',[0 1],...
    'ValueChangedFcn',@(sld1,event) slidermoving1(sld1));
sld2 = uislider(fig,...
    'Position',[100 150 120 3],...
    'Limit',[0 1],...
    'ValueChangedFcn',@(sld2,event) slidermoving2(sld2));
sld3 = uislider(fig,...
    'Position',[100 100 120 3],...
    'Limit',[0 1],...
    'ValueChangedFcn',@(sld3,event) slidermoving3(sld3));
sld4 = uislider(fig,...
    'Position',[100 50 120 3],...
    'Limit',[0 1],...
    'ValueChangedFcn',@(sld4,event) slidermoving4(sld4));
end
% Create ValueChangedFcn callback
function slidermoving1(sld1)
assignin('base', 'TH1', sld1.Value);
end
function slidermoving2(sld2)
assignin('base', 'TH2', sld2.Value);
end
function slidermoving3(sld3)
assignin('base', 'TS1', sld3.Value);
end
function slidermoving4(sld4)
assignin('base', 'TS2', sld4.Value);
end

