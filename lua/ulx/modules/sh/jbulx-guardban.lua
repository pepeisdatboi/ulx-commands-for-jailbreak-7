function ulx.guardban( calling_ply, target_ply, unban )
	if GAMEMODE_NAME == "jailbreak" then
		if unban then
			if target_ply:GetPData( "guardbanned", false ) then
				target_ply:RemovePData( "guardbanned" )
				ulx.fancyLogAdmin( calling_ply, "#A unbanned #T from guards",  target_ply );
			end
		else
			target_ply:SetPData( "guardbanned", 1 )
			ulx.fancyLogAdmin( calling_ply, "#A banned #T from guards",  target_ply );
			if target_ply:Team() == TEAM_GUARD then
				target_ply:SetTeam(TEAM_PRISONER);
				target_ply:KillSilent();
				target_ply:SendNotification("Forced to prisoners");
			end
		end
	else
		ULib.tsayError(calling_ply, "The current gamemode is not jailbreak!", true);
	end
end
local guardban = ulx.command("Jailbreak", "ulx guardban", ulx.guardban, "!guardban" )
guardban:defaultAccess( ULib.ACCESS_ADMIN )
guardban:addParam{ type=ULib.cmds.PlayerArg }
guardban:addParam{ type=ULib.cmds.BoolArg, invisible=true }
guardban:setOpposite( "ulx unguardban", { _, _, true }, {"!unguardban", "!guardunban"} )
guardban:help( "Bans target from guards." )


hook.Add( "JailBreakPlayerSwitchTeam", "jbulx_JailBreakPlayerSwitchTeam", function(player, team)
	if player:GetPData( "guardbanned", false ) and team == TEAM_GUARD then
		player:SetTeam(TEAM_PRISONER);
		player:KillSilent();
		player:SendNotification("Forced to prisoners");
		ULib.tsayError(player, "You are banned from joining guards!")
		ulx.fancyLogAdmin( nil, true,  "#T attemped to join guards while guardbanned", player)
	end
end )