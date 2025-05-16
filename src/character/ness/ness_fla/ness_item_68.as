// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//ness_fla.ness_item_68

package ness_fla
{
    import flash.display.MovieClip;
    import com.mcleodgaming.ssf2api.core.SSF2API;
    import com.mcleodgaming.ssf2api.core.SSF2Event;
    import flash.display.*;
    import flash.events.*;
    import flash.media.*;
    import flash.system.*;
    import adobe.utils.*;
    import flash.accessibility.*;
    import flash.desktop.*;
    import flash.errors.*;
    import flash.external.*;
    import flash.filters.*;
    import flash.geom.*;
    import flash.globalization.*;
    import flash.net.*;
    import flash.net.drm.*;
    import flash.printing.*;
    import flash.profiler.*;
    import flash.sampler.*;
    import flash.sensors.*;
    import flash.text.*;
    import flash.text.ime.*;
    import flash.text.engine.*;
    import flash.ui.*;
    import flash.utils.*;
    import flash.xml.*;

    public dynamic class ness_item_68 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var hand:MovieClip;
        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var hitBox4:MovieClip;
        public var hitBox5:MovieClip;
        public var hitBox6:MovieClip;
        public var itemBox:MovieClip;
        public var self:*;
        public var xframe:String;

        public function ness_item_68()
        {
            addFrameScript(0, this.frame1, 7, this.frame8, 8, this.frame9, 10, this.frame11, 11, this.frame12, 19, this.frame20, 21, this.frame22, 31, this.frame32, 32, this.frame33, 34, this.frame35, 35, this.frame36, 42, this.frame43, 45, this.frame46, 57, this.frame58, 58, this.frame59, 80, this.frame81, 88, this.frame89, 94, this.frame95, 112, this.frame113, 113, this.frame114, 118, this.frame119, 121, this.frame122, 127, this.frame128);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            if ((((parent) && (SSF2API.isReady())) && (this.self)))
            {
                this.xframe = null;
            };
        }

        internal function frame8():*
        {
            this.self.endAttack();
        }

        internal function frame9():*
        {
            this.xframe = "charging";
        }

        internal function frame11():*
        {
            gotoAndPlay("fan2");
        }

        internal function frame12():*
        {
            this.xframe = "attack";
        }

        internal function frame20():*
        {
            this.self.endAttack();
        }

        internal function frame22():*
        {
            this.self.playAttackSound(1);
        }

        internal function frame32():*
        {
            this.self.endAttack();
        }

        internal function frame33():*
        {
            this.xframe = "charging";
        }

        internal function frame35():*
        {
            gotoAndPlay("fan2");
        }

        internal function frame36():*
        {
            this.xframe = "attack";
        }

        internal function frame43():*
        {
            if (((this.self.getItem().getUses() <= this.self.getItem().getItemStat("uses_max")) && (this.self.getItem().getItemStat("linkage_id") == "starrod")))
            {
                this.self.getItem().fireProjectile("starrod_star");
                SSF2API.print(("Uses left: " + (this.self.getItem().getItemStat("uses_max") - this.self.getItem().getUses())));
                this.self.playAttackSound(1);
            }
            else
            {
                if (this.self.getItem().getItemStat("linkage_id") != "starrod")
                {
                    this.self.playAttackSound(1);
                }
                else
                {
                    SSF2API.print("Star Rod is empty, firing failed!");
                };
            };
        }

        internal function frame46():*
        {
            this.self.endAttack();
        }

        internal function frame58():*
        {
            this.self.endAttack();
        }

        internal function frame59():*
        {
            this.xframe = "charging";
        }

        internal function frame81():*
        {
            this.xframe = "attack";
        }

        internal function frame89():*
        {
            this.self.endAttack();
        }

        internal function frame95():*
        {
            if (this.self.getItem() != null)
            {
                if (((this.self.getItem().getItemStat("linkage_id") == "energytank") && (this.self.getDamage() > 0)))
                {
                    this.gotoAndPlay("assistloop");
                };
            };
        }

        internal function frame113():*
        {
            this.self.endAttack();
        }

        internal function frame114():*
        {
            SSF2API.addEventListener(this.self, SSF2Event.GROUND_TOUCH, this.self.toLand);
        }

        internal function frame119():*
        {
            gotoAndPlay("cuccoloop");
        }

        internal function frame122():*
        {
            if (this.self.getItem().getUses() <= this.self.getItem().getItemStat("uses_max"))
            {
                this.self.getItem().fireProjectile("bullet", 5, -21);
                SSF2API.print(("Uses left: " + (this.self.getItem().getItemStat("uses_max") - this.self.getItem().getUses())));
                this.self.playAttackSound(1);
            }
            else
            {
                SSF2API.print("Raygun is empty, firing failed!");
                this.self.playAttackSound(2);
            };
        }

        internal function frame128():*
        {
            this.self.endAttack();
        }


    }
}//package ness_fla

