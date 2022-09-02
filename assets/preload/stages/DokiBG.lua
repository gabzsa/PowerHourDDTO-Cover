function onCreate()
	-- background shit
	makeLuaSprite('bg', 'bg', -1100, -650);
	setScrollFactor('bg', 0.9, 0.9);
	scaleObject('bg', 1.7, 1.7);
	
	makeLuaSprite('desks', 'desks', -1200, -600);
	setScrollFactor('desks', 1.1, 1.1);
	scaleObject('desks', 1.8, 1.8);

	makeLuaSprite('chairA', 'chairA', 595, 205);
	setScrollFactor('chairA', 1, 1);
	scaleObject('chairA', 1.1, 1.1);

	makeLuaSprite('chairB', 'chairB', 837, 325);
	setScrollFactor('chairA', 1, 1);
	scaleObject('chairA', 1.1, 1.1);


	-- sprites that only load if Low Quality is turned off
	if not lowQuality then
		
	end

	addLuaSprite('bg', false);
	addLuaSprite('desks', true);
	addLuaSprite('chairA', false);
	addLuaSprite('chairB', false);
	
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end