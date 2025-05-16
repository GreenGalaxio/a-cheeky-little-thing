// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//bomberman_fla.ichigo_item_50

package bomberman_fla
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

    public dynamic class ichigo_item_50 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var hitBox4:MovieClip;
        public var itemBox:MovieClip;
        public var xframe:String;
        public var self:*;

        public function ichigo_item_50()
        {
            addFrameScript(0, this.frame1, 5, this.frame6, 10, this.frame11, 15, this.frame16, 16, this.frame17, 31, this.frame32, 34, this.frame35, 40, this.frame41, 41, this.frame42, 44, this.frame45, 49, this.frame50, 50, this.frame51, 53, this.frame54, 64, this.frame65, 72, this.frame73, 98, this.frame99, 103, this.frame104, 110, this.frame111, 111, this.frame112, 126, this.frame127, 136, this.frame137, 143, this.frame144);
        }

        internal function frame1():*
        {
            this.xframe = null;
            this.self = SSF2API.getCharacter(this);
        }

        internal function frame6():*
        {
            this.self.endAttack();
        }

        internal function frame11():*
        {
            this.xframe = "charging";
        }

        internal function frame16():*
        {
            gotoAndPlay("loopfansmash");
        }

        internal function frame17():*
        {
            this.xframe = "attack";
        }

        internal function frame32():*
        {
            this.self.endAttack();
        }

        internal function frame35():*
        {
            this.self.playAttackSound(1);
        }

        internal function frame41():*
        {
            this.self.endAttack();
        }

        internal function frame42():*
        {
            this.xframe = null;
        }

        internal function frame45():*
        {
            this.xframe = "charging";
        }

        internal function frame50():*
        {
            gotoAndPlay("beamsword2_charge");
        }

        internal function frame51():*
        {
            this.xframe = "attack";
        }

        internal function frame54():*
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

        internal function frame65():*
        {
            this.self.endAttack();
        }

        internal function frame73():*
        {
            this.self.endAttack();
        }

        internal function frame99():*
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

        internal function frame127():*
        {
            this.gotoAndPlay("cuccoloop");
        }

        internal function frame137():*
        {
            if (this.self.getItem() != null)
            {
                if (((this.self.getItem().getItemStat("linkage_id") == "energytank") && (this.self.getDamage() > 0)))
                {
                    this.gotoAndPlay("assistloop");
                };
            };
        }

        internal function frame144():*
        {
            this.self.endAttack();
        }


    }
}//package bomberman_fla

