
function onCreatePost()
	precacheImage('icons/pibby')
	precacheImage('icons/pibbylose')
	precacheImage('icons/jake')
	precacheImage('icons/jakelose')
initLuaShader("Glitchy")

	makeLuaSprite('IconPibby', 'icons/pibby', 950 ,setProperty('IconPibby.y', getProperty('iconP1.y')))
	setObjectCamera('IconPibby', 'hud')
	addLuaSprite('IconPibby', true)
	setProperty('IconPibby.visible', false)
	setPropertyLuaSprite('IconPibby', 'flipX', true);
	
	makeLuaSprite('pibbylose', 'icons/pibbylose', 950, setProperty('pibbylose.y', getProperty('iconP1.y')))
	setObjectCamera('pibbylose', 'hud')
	addLuaSprite('pibbylose', true)
	setObjectOrder('pibbylose', getObjectOrder('iconP1'))
	setProperty('pibbylose.visible', false)
	setPropertyLuaSprite('pibbylose', 'flipX', true);

	makeLuaSprite('iconJake', 'icons/jake', 200, setProperty('jake.y', getProperty('iconP2.y')))
	setObjectCamera('iconJake', 'hud')
	addLuaSprite('iconJake', true)
	setObjectOrder('iconJake', getObjectOrder('iconP2'))
	setProperty('iconJake.visible', false)
	
	makeLuaSprite('jakelose', 'icons/jakelose', 200, setProperty('jakelose.y', getProperty('iconP2.y')))
	setObjectCamera('jakelose', 'hud')
	addLuaSprite('jakelose', true)
	setObjectOrder('jakelose', getObjectOrder('iconP2'))
	setProperty('jakelose.visible', false)

setSpriteShader("pibbylose", "Glitchy")
setProperty('pibbylose.useFramePixels', false)
	setSpriteShader("iconJake", "Glitchy")
setProperty('iconJake.useFramePixels', false)
setSpriteShader("jakelose", "Glitchy")
setProperty('jakelose.useFramePixels', false)


end	
function onUpdatePost(e)
setProperty('iconJake.scale.x', getProperty('iconP2.scale.x'))
	setProperty('iconJake.scale.y', getProperty('iconP2.scale.y'))
setProperty('IconPibby.scale.x', getProperty('iconP1.scale.x'))
	setProperty('IconPibby.scale.y', getProperty('iconP1.scale.y'))
setProperty('pibbylose.scale.x', getProperty('iconP1.scale.x'))
	setProperty('pibbylose.scale.y', getProperty('iconP1.scale.y'))
setProperty('jakelose.scale.x', getProperty('iconP1.scale.x'))
	setProperty('jakelose.scale.y', getProperty('iconP1.scale.y'))
setProperty('iconJake.y', getProperty('iconP2.y'))
setProperty('jakelose.y', getProperty('iconP2.y'))
setProperty('pibbylose.y', getProperty('iconP1.y'))
setProperty('IconPibby.y', getProperty('iconP1.y'))
		
		setShaderFloat("iconJake", "iTime", os.clock())
		setShaderFloat("jakelose", "iTime", os.clock())
setShaderFloat("pibbylose", "iTime", os.clock())

		if getProperty('health') < 0.4 then
			setProperty('IconPibby.visible', false)
			setProperty('pibbylose.visible', true)
			setShaderFloat("pibbylose", "AMT", 0.25)
            setShaderFloat("pibbylose", "SPEED", 0.15)
		else
			setProperty('IconPibby.visible',  true)
			setProperty('pibbylose.visible', false)
			
	end
	
		if getProperty('health') < 1.6 then
			setProperty('jakelose.visible', false)
			setProperty('iconJake.visible', true)
			setShaderFloat("iconJake", "AMT", 0.05)
            setShaderFloat("iconJake", "SPEED", 0.05)
		else
		    setShaderFloat("jakelose", "AMT", 0.25)
            setShaderFloat("jakelose", "SPEED", 0.2)
			setProperty('jakelose.visible',  true)
			setProperty('iconJake.visible', false)
		end
	end
