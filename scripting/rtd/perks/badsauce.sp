/**
* Bad Sauce perk.
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

DEFINE_CALL_APPLY(BadSauce)

public void BadSauce_Init(const Perk perk)
{
	Events.OnResupply(perk, BadSauce_OnResupply);
}

public void BadSauce_ApplyPerk(const int client, const Perk perk)
{
	float fMilkDuration = perk.GetPrefFloat("milk");
	float fJarateDuration = perk.GetPrefFloat("jarate");
	float fBleedDuration = perk.GetPrefFloat("bleed");
	float fPerkDuration = GetPerkTimeFloat(perk);

	if (fMilkDuration >= 0.0)
		TF2_AddCondition(client, TFCond_Milked, fMilkDuration > 0.0 ? fMilkDuration : fPerkDuration);

	if (fJarateDuration >= 0.0)
		TF2_AddCondition(client, TFCond_Jarated, fJarateDuration > 0.0 ? fJarateDuration : fPerkDuration);

	if (fBleedDuration >= 0.0)
		TF2_MakeBleed(client, client, fBleedDuration > 0.0 ? fBleedDuration : fPerkDuration);
}

public void BadSauce_OnResupply(const int client)
{
	RemovePerk(client);
}
