// Decompiled by AS3 Sorcerer 6.20
// www.as3sorcerer.com

//lloyd_fla.lloyd_item_58

package lloyd_fla
{
    import flash.display.MovieClip;
    import com.mcleodgaming.ssf2api.core.SSF2API;
    import com.mcleodgaming.ssf2api.core.SSF2Event;
    import flash.geom.*;
    import flash.display.*;
    import flash.events.*;
    import flash.utils.*;
    import flash.media.*;
    import flash.filters.*;
    import adobe.utils.*;
    import flash.accessibility.*;
    import flash.desktop.*;
    import flash.errors.*;
    import flash.external.*;
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
    import flash.xml.*;

    public dynamic class lloyd_item_58 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var hand:MovieClip;
        public var hitBox:MovieClip;
        public var itemBox:MovieClip;
        public var self:*;
        public var xframe:String;

        public function lloyd_item_58()
        {
            addFrameScript(0, this.frame1, 5, this.frame6, 6, this.frame7, 9, this.frame10, 10, this.frame11, 14, this.frame15, 18, this.frame19, 24, this.frame25, 25, this.frame26, 27, this.frame28, 30, this.frame31, 31, this.frame32, 38, this.frame39, 44, this.frame45, 53, this.frame54, 86, this.frame87, 90, this.frame91, 93, this.frame94, 105, this.frame106, 109, this.frame110, 110, this.frame111, 120, this.frame121);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            if ((((parent) && (SSF2API.isReady())) && (this.self)))
            {
                this.xframe = null;
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

        internal function frame25():*
        {
            this.self.endAttack();
        }

        internal function frame26():*
        {
            this.xframe = null;
        }

        internal function frame28():*
        {
            this.xframe = "charging";
        }

        internal function frame31():*
        {
            gotoAndPlay("beamsword2_charge");
        }

        internal function frame32():*
        {
            this.xframe = "attack";
        }

        internal function frame39():*
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

        internal function frame45():*
        {
            this.self.endAttack();
        }

        internal function frame54():*
        {
            this.self.endAttack();
        }

        internal function frame87():*
        {
            this.self.endAttack();
        }

        internal function frame91():*
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

        internal function frame94():*
        {
            this.self.endAttack();
        }

        internal function frame106():*
        {
            if (this.self.getItem() != null)
            {
                if (((this.self.getItem().getItemStat("linkage_id") == "energytank") && (this.self.getDamage() > 0)))
                {
                    this.gotoAndPlay("assistloop");
                };
            };
        }

        internal function frame110():*
        {
            this.self.endAttack();
        }

        internal function frame111():*
        {
            SSF2API.addEventListener(this.self, SSF2Event.GROUND_TOUCH, this.self.toLand);
        }

        internal function frame121():*
        {
            gotoAndPlay("cuccoloop");
        }


    }
}//package lloyd_fla

