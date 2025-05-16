// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//samus_fla.megaman_item_gif_65

package samus_fla
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

    public dynamic class megaman_item_gif_65 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var hand:MovieClip;
        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var itemBox:MovieClip;
        public var xframe:String;
        public var self:*;

        public function megaman_item_gif_65()
        {
            addFrameScript(0, this.frame1, 5, this.frame6, 6, this.frame7, 9, this.frame10, 10, this.frame11, 14, this.frame15, 18, this.frame19, 25, this.frame26, 26, this.frame27, 28, this.frame29, 31, this.frame32, 32, this.frame33, 37, this.frame38, 45, this.frame46, 54, this.frame55, 85, this.frame86, 97, this.frame98, 100, this.frame101, 103, this.frame104, 110, this.frame111, 111, this.frame112, 121, this.frame122);
        }

        internal function frame1():*
        {
            this.xframe = null;
            if (SSF2API.isReady())
            {
                this.self = SSF2API.getCharacter(this);
            };
        }

        internal function frame6():*
        {
            this.self.endAttack();
        }

        internal function frame7():*
        {
            this.xframe = "charging";
        }

        internal function frame10():*
        {
            gotoAndPlay("fan2");
        }

        internal function frame11():*
        {
            this.xframe = "attack";
        }

        internal function frame15():*
        {
            this.self.endAttack();
        }

        internal function frame19():*
        {
            this.self.playAttackSound(1);
        }

        internal function frame26():*
        {
            this.self.endAttack();
        }

        internal function frame27():*
        {
            this.xframe = null;
        }

        internal function frame29():*
        {
            this.xframe = "charging";
        }

        internal function frame32():*
        {
            gotoAndPlay("beamsword2_charge");
        }

        internal function frame33():*
        {
            this.xframe = "attack";
        }

        internal function frame38():*
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

        internal function frame55():*
        {
            this.self.endAttack();
        }

        internal function frame86():*
        {
            this.self.endAttack();
        }

        internal function frame98():*
        {
            if (this.self.getItem() != null)
            {
                if (((this.self.getItem().getItemStat("linkage_id") == "energytank") && (this.self.getDamage() > 0)))
                {
                    this.gotoAndPlay("assistloop");
                };
            };
        }

        internal function frame101():*
        {
            this.self.endAttack();
        }

        internal function frame104():*
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

        internal function frame111():*
        {
            this.self.endAttack();
        }

        internal function frame112():*
        {
            SSF2API.addEventListener(this.self, SSF2Event.GROUND_TOUCH, this.self.toLand);
        }

        internal function frame122():*
        {
            gotoAndPlay("cuccoloop");
        }


    }
}//package samus_fla

