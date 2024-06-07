-- icon change script by NTH208
function onEvent(name,value1,value2)
if name == 'IconChange' then
		        makeLuaSprite('icon', 'icons/'..value1, 620, getProperty('iconP1.y'))
                setObjectCamera('icon', 'camHUD')
                setProperty('icon.flipX',true)
                scaleObject('icon', 1, 1)
                addLuaSprite('icon', true)				
                
                makeLuaSprite('icon-loss', 'icons/'..value1..'-loss', 620, getProperty('iconP1.y'))
                setObjectCamera('icon-loss', 'camHUD')
                setProperty('icon-loss.visible',false)
                setProperty('icon-loss.flipX',true)
                scaleObject('icon-loss', 1, 1)
                addLuaSprite('icon-loss', true)     

initLuaShader("Glitchy")
setSpriteShader("icon-loss", "Glitchy")
setProperty('icon-loss.useFramePixels', false)
if value1 == 'none' then
setProperty('iconP1.visible',true)          
else setProperty('iconP1.visible',false)
end

--setTextColor('scoreTxt',value2)
end
end

function onUpdate()
  setProperty('icon.x', getProperty('iconP1.x'))
  setProperty('icon.y', getProperty('iconP1.y'))  
  setProperty('icon-loss.x', getProperty('iconP1.x'))
  setProperty('icon-loss.y', getProperty('iconP1.y'))  
  setShaderFloat("icon-loss", "iTime", os.clock())

    if getProperty('healthBar.percent') < 25 then
       setProperty('icon-loss.visible',true)
       setProperty('icon.visible',false)
       setShaderFloat("icon-loss", "AMT", 0.2)
       setShaderFloat("icon-loss", "SPEED", 0.15)
       else
       setProperty('icon-loss.visible',false)
       setProperty('icon.visible',true)
       setShaderFloat("icon-loss", "AMT", 0.0)
       setShaderFloat("icon-loss", "SPEED", 0.1)
	end

	setProperty('icon.scale.x', getProperty('iconP1.scale.x'))
	setProperty('icon.scale.y', getProperty('iconP1.scale.y'))
	setProperty('icon.alpha', getProperty('iconP1.alpha'))
	setProperty('icon-loss.scale.x', getProperty('iconP1.scale.x'))
	setProperty('icon-loss.scale.y', getProperty('iconP1.scale.y'))
	setProperty('icon-loss.alpha', getProperty('iconP1.alpha'))
end 
