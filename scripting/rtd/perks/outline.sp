/**
* Outline perk.
* Copyright (C) 2023 Filip Tomaszewski
*
* This program is free software: you can redistribute it and/or modify
* it under the terms of the GNU General Public License as published by
* the Free Software Foundation, either version 3 of the License, or
* (at your option) any later version.
*
* This program is distributed in the hope that it will be useful,
* but WITHOUT ANY WARRANTY; without even the implied warranty of
* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
* GNU General Public License for more details.
*
* You should have received a copy of the GNU General Public License
* along with this program.  If not, see <http://www.gnu.org/licenses/>.
*/

#define InitialGlow Int[0]

DEFINE_CALL_APPLY_REMOVE(Outline)

public void Outline_ApplyPerk(const int client, const Perk perk)
{
	Cache[client].InitialGlow = GetEntProp(client, Prop_Send, "m_bGlowEnabled");
	SetEntProp(client, Prop_Send, "m_bGlowEnabled", 1);
}

public void Outline_RemovePerk(const int client, const RTDRemoveReason eRemoveReason)
{
	SetEntProp(client, Prop_Send, "m_bGlowEnabled", Cache[client].InitialGlow);
}

#undef InitialGlow
