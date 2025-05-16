// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//metaknight_fla.bmitem_49

package metaknight_fla
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

    public dynamic class bmitem_49 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var hitBox4:MovieClip;
        public var hitBox5:MovieClip;
        public var itemBox:MovieClip;
        public var self:*;
        public var xframe:String;

        public function bmitem_49()
        {
            addFrameScript(0, this.frame1, 11, this.frame12, 12, this.frame13, 15, this.frame16, 16, this.frame17, 26, this.frame27, 33, this.frame34, 50, this.frame51, 53, this.frame54, 55, this.frame56, 56, this.frame57, 58, this.frame59, 75, this.frame76, 99, this.frame100, 134, this.frame135, 137, this.frame138, 144, this.frame145, 145, this.frame146, 156, this.frame157, 171, this.frame172, 172, this.frame173);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            this.xframe = null;
        }

        internal function frame12():*
        {
            this.self.endAttack();
        }

        internal function frame13():*
        {
            this.xframe = "charging";
        }

        internal function frame16():*
        {
            gotoAndPlay("fan2");
        }

        internal function frame17():*
        {
            this.xframe = "attack";
        }

        internal function frame27():*
        {
            this.self.endAttack();
        }

        internal function frame34():*
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

        internal function frame51():*
        {
            this.self.endAttack();
        }

        internal function frame54():*
        {
            this.xframe = "charging";
        }

        internal function frame56():*
        {
            gotoAndPlay("beamsword2_charge");
        }

        internal function frame57():*
        {
            this.xframe = "attack";
        }

        internal function frame59():*
        {
            this.self.playAttackSound(1);
        }

        internal function frame76():*
        {
            this.self.endAttack();
        }

        internal function frame100():*
        {
            this.self.endAttack();
        }

        internal function frame135():*
        {
            this.self.endAttack();
        }

        internal function frame138():*
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

        internal function frame145():*
        {
            this.self.endAttack();
        }

        internal function frame146():*
        {
            SSF2API.addEventListener(this.self, SSF2Event.GROUND_TOUCH, this.self.toLand);
        }

        internal function frame157():*
        {
            gotoAndPlay("cuccoloop");
        }

        internal function frame172():*
        {
            if (this.self.getItem() != null)
            {
                if (((this.self.getItem().getItemStat("linkage_id") == "energytank") && (this.self.getDamage() > 0)))
                {
                    this.gotoAndPlay("assistloop");
                };
            };
        }

        internal function frame173():*
        {
            this.self.endAttack();
        }


    }
}//package metaknight_fla

