-- Script by Shadow Mario
-- Customized for Simplicity by Kevin Kuntz
function onCreate()
	makeAnimationList();
	makeOffsets();
	
	-- boxing guy
	makeAnimatedLuaSprite('sayori', 'characters/sayori', defaultOpponentX - 125, defaultOpponentY - 75);
	addAnimationByPrefix('sayori', 'singLEFT', 'sayori left', 15, false);
	addAnimationByPrefix('sayori', 'singDOWN', 'sayori down', 15, false);
	addAnimationByPrefix('sayori', 'singUP', 'sayori up', 15, false);
	addAnimationByPrefix('sayori', 'singRIGHT', 'sayori right', 15, false);
	addAnimationByPrefix('sayori', 'danceLeft', 'sayori DanceLeft', 15, false);
	addAnimationByPrefix('sayori', 'danceRight', 'sayori DanceRight', 15, false);
	addAnimationByPrefix('sayori', 'bowtie', 'sayori bowtie', 15, false);
	
	addLuaSprite('sayori', false);

	playAnimation('sayori', 0, true);
end

animationsList = {}
holdTimers = {sayori = -1.0};
noteDatas = {sayori = 0};
function makeAnimationList()
	animationsList[0] = 'singLEFT';
	animationsList[1] = 'singDOWN';
	animationsList[2] = 'singUP';
	animationsList[3] = 'singRIGHT';
	animationsList[4] = 'danceLeft';
	animationsList[5] = 'danceRight';
	animationsList[6] = 'bowtie';
end 
offsetssayori = {};
function makeOffsets()
	offsetssayori[0] = {x = 0, y = 0}; --idle
	offsetssayori[1] = {x = 0, y = 0}; --left
	offsetssayori[2] = {x = 0, y = 0}; --down
	offsetssayori[3] = {x = 0, y = 0}; --up
	offsetssayori[4] = {x = 0, y = 0}; --right
	offsetssayori[5] = {x = 0, y = 0};
	offsetssayori[6] = {x = 0, y = 0};
end

function opponentNoteHit(id, direction, noteType, isSustainNote)
	if noteType == 'No Animation' then
		if not isSustainNote then
			noteDatas.sayori = direction;
		end	
	characterToPlay = 'sayori'
	animToPlay = noteDatas.sayori;
	holdTimers.sayori = 0;
			
	playAnimation(characterToPlay, animToPlay, true);
	end
end

function onUpdate(elapsed)
	holdCap = stepCrochet * 0.004;
	if holdTimers.sayori >= 0 then
		holdTimers.sayori = holdTimers.sayori + elapsed;
		if holdTimers.sayori >= holdCap then
			holdTimers.sayori = -1;
		end
	end
end

function onCountdownTick(counter)
	beatHitDance(counter);
end

function onBeatHit()
	beatHitDance(curBeat);
end

function beatHitDance(counter)
	if counter % 1 == 0 then
		if holdTimers.sayori < 0 then
			playAnimation('sayori', 4, false);
		end
	end
	if counter % 2 == 0 then
		if holdTimers.sayori < 0 then
			playAnimation('sayori', 5, false);
		end
	end
end

function playAnimation(character, animId, forced)
	-- 0 = singLEFT
	-- 1 = singDOWN
	-- 2 = singUP
	-- 3 = singRIGHT
	-- 4 = danceLeft
	-- 5 = danceRight
	-- 6 = bowtie 
	animName = animationsList[animId];
	--debugPrint(animName);
	if character == 'sayori' then
		objectPlayAnimation('sayori', animName, forced); -- this part is easily broke if you use objectPlayAnim (I have no idea why its like this)
		setProperty('sayori.offset.x', offsetssayori[animId].x);
		setProperty('sayori.offset.y', offsetssayori[animId].y);
	end
end