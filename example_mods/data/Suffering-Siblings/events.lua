--I'm too lazy to use the event that they gave me ok?
function onStepHit()
if curStep < 3 then
setProperty('blackOther.alpha',1)
doTweenAlpha('blackOther','blackOther',0,12,'linear')
end
if curStep == 8664 then
setProperty('blackOther.alpha',1)
end
if curStep == 4868 then
 cameraFlash('camGame', 'FFFFFF', 1);
 for i =0,3 do
 noteTweenAlpha('note'..i,i,0,0.5)
 end
 setProperty('Jake.alpha',0)
setProperty('gf.alpha',0)
setProperty('blackGame.alpha',1)
setProperty('dark.visible',false)
setProperty('light.visible',false)
setProperty('buld.visible',false)
end
if curStep == 5251 then
for i =0,3 do
 noteTweenAlpha('note'..i,i,1,1)
 end
  cameraFlash('camGame', 'FFFFFF', 1);
    setProperty('gf.alpha',1)
 setProperty('Jake.alpha',1)
setProperty('blackGame.alpha',0)
setProperty('dark.visible',true)
setProperty('light.visible',true)
setProperty('buld.visible',true)
end


if curStep == 5672 then
cameraFlash('camOther', 'FFFFFF', 1);
doTweenAlpha('HUD','camHUD',0,4,'linear')
setProperty('camGame.visible',false)
end
end

function onEvent(name,value1,value2)
if name == 'Change Character' then
if dadName == 'finn-R' then
runHaxeCode([[
game.dad.setColorTransform(1,1,1,1,0,0,0,0);
    ]])
end
end
end

function onTimerCompleted(tag)
if tag == 'Waa' then
cmon = false
end
end

function onUpdate()
if cmon then
triggerEvent('Camera Follow Pos','2000','1100')
end
end