// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//peach_fla.peach_item_85

package peach_fla
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

    public dynamic class peach_item_85 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var hitBox:MovieClip;
        public var itemBox:MovieClip;
        public var stance:MovieClip;
        public var self:*;
        public var xframe:String;

        public function peach_item_85()
        {
            addFrameScript(0, this.frame1, 5, this.frame6, 6, this.frame7, 9, this.frame10, 10, this.frame11, 14, this.frame15, 18, this.frame19, 27, this.frame28, 28, this.frame29, 30, this.frame31, 33, this.frame34, 34, this.frame35, 36, this.frame37, 40, this.frame41, 49, this.frame50, 59, this.frame60, 94, this.frame95, 97, this.frame98, 102, this.frame103, 103, this.frame104, 111, this.frame112, 119, this.frame120, 124, this.frame125);
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

        internal function frame28():*
        {
            this.self.endAttack();
        }

        internal function frame29():*
        {
            this.xframe = null;
        }

        internal function frame31():*
        {
            this.xframe = "charging";
        }

        internal function frame34():*
        {
            gotoAndPlay("beamsword2_charge");
        }

        internal function frame35():*
        {
            this.xframe = "attack";
        }

        internal function frame37():*
        {
            this.self.playAttackSound(1);
        }

        internal function frame41():*
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

        internal function frame50():*
        {
            this.self.endAttack();
        }

        internal function frame60():*
        {
            this.self.endAttack();
        }

        internal function frame95():*
        {
            this.self.endAttack();
        }

        internal function frame98():*
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

        internal function frame103():*
        {
            this.self.endAttack();
        }

        internal function frame104():*
        {
            SSF2API.addEventListener(this.self, SSF2Event.GROUND_TOUCH, this.self.toLand);
        }

        internal function frame112():*
        {
            gotoAndPlay("cuccoloop");
        }

        internal function frame120():*
        {
            if (this.self.getItem() != null)
            {
                if (((this.self.getItem().getItemStat("linkage_id") == "energytank") && (this.self.getDamage() > 0)))
                {
                    this.gotoAndPlay("assistloop");
                };
            };
        }

        internal function frame125():*
        {
            this.self.endAttack();
        }


    }
}//package peach_fla

