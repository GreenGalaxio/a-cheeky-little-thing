// Decompiled by AS3 Sorcerer 6.20
// www.as3sorcerer.com

//link_fla.link_item_59

package link_fla
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

    public dynamic class link_item_59 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var hand:MovieClip;
        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var hitBox4:MovieClip;
        public var hitBox5:MovieClip;
        public var itemBox:MovieClip;
        public var self:*;
        public var xframe:String;

        public function link_item_59()
        {
            addFrameScript(0, this.frame1, 5, this.frame6, 6, this.frame7, 9, this.frame10, 10, this.frame11, 15, this.frame16, 19, this.frame20, 25, this.frame26, 26, this.frame27, 28, this.frame29, 31, this.frame32, 32, this.frame33, 38, this.frame39, 45, this.frame46, 55, this.frame56, 89, this.frame90, 102, this.frame103, 103, this.frame104, 107, this.frame108, 115, this.frame116, 116, this.frame117, 120, this.frame121);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            this.xframe = null;
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

        internal function frame16():*
        {
            this.self.endAttack();
        }

        internal function frame20():*
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

        internal function frame46():*
        {
            this.self.endAttack();
        }

        internal function frame56():*
        {
            this.self.endAttack();
        }

        internal function frame90():*
        {
            this.self.endAttack();
        }

        internal function frame103():*
        {
            if (this.self.getItem() != null)
            {
                if (((this.self.getItem().getItemStat("linkage_id") == "energytank") && (this.self.getDamage() > 0)))
                {
                    this.gotoAndPlay("assistloop");
                };
            };
        }

        internal function frame104():*
        {
            this.self.endAttack();
        }

        internal function frame108():*
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

        internal function frame116():*
        {
            this.self.endAttack();
        }

        internal function frame117():*
        {
            SSF2API.addEventListener(this.self, SSF2Event.GROUND_TOUCH, this.self.toLand);
        }

        internal function frame121():*
        {
            gotoAndPlay("cucco");
        }


    }
}//package link_fla

