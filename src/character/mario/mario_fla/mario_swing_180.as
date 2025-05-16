// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//mario_fla.mario_swing_180

package mario_fla
{
    import flash.display.MovieClip;
    import com.mcleodgaming.ssf2api.core.SSF2API;
    import com.mcleodgaming.ssf2api.core.SSF2Event;
    import flash.display.*;
    import flash.events.*;
    import flash.media.*;
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
    import flash.system.*;
    import flash.text.*;
    import flash.text.ime.*;
    import flash.text.engine.*;
    import flash.ui.*;
    import flash.utils.*;
    import flash.xml.*;

    public dynamic class mario_swing_180 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var itemBox:MovieClip;
        public var hitBox:MovieClip;
        public var hand:MovieClip;
        public var self:*;
        public var xframe:String;

        public function mario_swing_180()
        {
            addFrameScript(0, this.frame1, 7, this.frame8, 8, this.frame9, 11, this.frame12, 12, this.frame13, 18, this.frame19, 23, this.frame24, 31, this.frame32, 32, this.frame33, 36, this.frame37, 39, this.frame40, 40, this.frame41, 42, this.frame43, 53, this.frame54, 65, this.frame66, 100, this.frame101, 108, this.frame109, 118, this.frame119, 120, this.frame121, 129, this.frame130, 130, this.frame131, 140, this.frame141);
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

        internal function frame12():*
        {
            gotoAndPlay("fan2");
        }

        internal function frame13():*
        {
            this.xframe = "attack";
        }

        internal function frame19():*
        {
            this.self.endAttack();
        }

        internal function frame24():*
        {
            this.self.playAttackSound(1);
        }

        internal function frame32():*
        {
            this.self.endAttack();
        }

        internal function frame33():*
        {
            this.xframe = null;
        }

        internal function frame37():*
        {
            this.xframe = "charging";
        }

        internal function frame40():*
        {
            gotoAndPlay("beamsword2_charge");
        }

        internal function frame41():*
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

        internal function frame54():*
        {
            this.self.endAttack();
        }

        internal function frame66():*
        {
            this.self.endAttack();
        }

        internal function frame101():*
        {
            this.self.endAttack();
        }

        internal function frame109():*
        {
            if (this.self.getItem() != null)
            {
                if (((this.self.getItem().getItemStat("linkage_id") == "energytank") && (this.self.getDamage() > 0)))
                {
                    this.gotoAndPlay("assistloop");
                };
            };
        }

        internal function frame119():*
        {
            this.self.endAttack();
        }

        internal function frame121():*
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

        internal function frame130():*
        {
            this.self.endAttack();
        }

        internal function frame131():*
        {
            SSF2API.addEventListener(this.self, SSF2Event.GROUND_TOUCH, this.self.toLand);
        }

        internal function frame141():*
        {
            gotoAndPlay("cuccoloop");
        }


    }
}//package mario_fla

