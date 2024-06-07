local chromFreq = 4 --default = 2
local chromAmount = 0.4 --default = 0.65
chromatic = 0.001
local enabled = false
local activated = false
function onCreate()
    enabledShader = getPropertyFromClass('ClientPrefs','shaders')
end
function onCreatePost()
    --ChromaticZoom
        initLuaShader('ChromaticAbberationHUD')

        makeLuaSprite('chromToggle')
        setProperty('chromToggle.flipX',true)
        makeLuaSprite('chromGraphic')
        makeGraphic("chromGraphic", screenWidth+ 100, screenHeight)
        setProperty('chromGraphic.flipX',true)
        
        setSpriteShader("chromGraphic", 'chromToggle')

        makeLuaSprite('chromX',nil,0,0)
        chromToggle()
     --ChromaticSing
       -- initLuaShader("vcr")
    
    --makeLuaSprite("temporaryShader1")
   -- setSpriteShader("temporaryShader1", "vcr")
    
   -- makeLuaSprite('shaderXb',nil,0,0)
 --   makeLuaSprite('shaderXr',nil,0,0)
  --  makeLuaSprite('shaderXg',nil,0,0)
  --  singToogle()
    end

--function opponentNoteHit(id,noteData,noteType,isSusNote)
--if math.random(1,3) == 1 then
--    setProperty('shaderXb.x',chromatic * getRandomFloat(-4, 4))
--    doTweenX('shaderbLol','shaderXb',0,0.1,'linear')
    --
--    setProperty('shaderXr.x',chromatic * getRandomFloat(-4, 4))
   -- doTweenX('shaderrLol','shaderXr',0,0.1,'linear')
    --
   -- setProperty('shaderXg.x',chromatic * getRandomFloat(-4, 4))
 --   doTweenX('shadergbLol','shaderXg',0,0.1,'linear')
-- end
--end

function onUpdate()
    if enabled then
        local chromValue = getProperty('chromX.x')
        setShaderFloat('chromToggle', "amount", chromValue)
        if chromAmount == 0 and chromValue == 0 then
            enabled = false
        end
        
     --   singValueb = getProperty('shaderXb.x')
   --     setShaderFloat('temporaryShader1', "bOffset", singValueb)
        
     --   singValuer = getProperty('shaderXr.x')
      --  setShaderFloat('temporaryShader1', "rOffset", singValuer)
        
       -- singValueg = getProperty('shaderXg.x')
     --   setShaderFloat('temporaryShader1', "gOffset", singValueg)
    end
end
function onBeatHit()
    if activated and curBeat % chromFreq == 0 then
        chromBeat()
    end
end

function onEvent(name,v1,v2)
if name =='Add Camera Zoom' then
chromBeat()
end

if name == 'change amount chrom' then
chromAmount = v1
end
end

function onTweenCompleted(tag)
--zoomBeat
    if tag == 'chromLol' then
        setProperty('chromX.x',0)
    end
    
end

function chromBeat()
    setProperty('chromX.x',chromAmount)
    doTweenX('chromLol','chromX',0,0.35,'linear')
    enabled = true
end

function chromToggle()
    runHaxeCode([[
            var chromToggle = game.createRuntimeShader('ChromaticAbberationHUD');
            var shaderVcr= game.createRuntimeShader('glitchChromatic');
            
            game.camGame.setFilters([new ShaderFilter(shaderVcr),new ShaderFilter(chromToggle)]);
            game.camHUD.setFilters([new ShaderFilter(shaderVcr),new ShaderFilter(chromToggle)]);
            game.getLuaObject('chromToggle').shader = chromToggle;
            game.getLuaObject("temporaryShader1").shader = shaderVcr;
                
            return;
        ]]
    )
    activated = true
end
