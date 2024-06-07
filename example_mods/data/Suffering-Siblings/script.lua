twoBeat = false
mid = true
bordersSize = 90
function onStepHit()
if curStep == 128 then
mid = false
doTweenY('1Y','cinematicBorder1',-90,1.7,'linear')
doTweenY('2Y','cinematicBorder2',screenHeight + bordersSize,1.7,'linear')
setProperty('defaultCamZoom',1)
end
end
