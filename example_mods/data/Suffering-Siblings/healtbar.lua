bordersSize = 90

function onCreatePost()
makeLuaSprite('cinematicBorder1',nil,0,0)
        makeLuaSprite('cinematicBorder2',nil,0,screenHeight - bordersSize)
        for borders = 1,2 do
            makeGraphic('cinematicBorder'..borders,screenWidth+2,bordersSize,'000000')
            setObjectCamera('cinematicBorder'..borders,'camHUD')
            addLuaSprite('cinematicBorder'..borders,false)
            end

makeAnimatedLuaSprite('healthBarScript','healthbar/iconbar',200,0);
scaleObject('healthBarScript',2,2)
addAnimationByPrefix('healthBarScript', 'loss', 'Icons Bar 3', 24, true);
addAnimationByPrefix('healthBarScript', 'normal', 'Icons Bar 2', 24, true);
addAnimationByPrefix('healthBarScript', 'win', 'Icons Bar 1', 24, true);
objectPlayAnimation('healthBarScript', 'win', true);
setObjectCamera('healthBarScript', 'camHUD')
setScrollFactor('healthBarScript', 0.9, 0.9)
addLuaSprite('healthBarScript')
if downscroll then
setProperty('iconP1.y', 20)
setProperty('iconP2.y',10)
else
setProperty('iconP1.y', 560)
setProperty('iconP2.y',550)
setProperty('healthBarScript.y',550)
end

function onCreate()
setProperty('healthBar.visible', false);
setProperty('healthBarBG.visible', false);    
end

function onUpdatePost(elapsed)
setProperty('iconP1.x', 620)
setProperty('iconP2.x', 520)
end

end

function onBeatHit()
end
