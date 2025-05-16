// Decompiled by AS3 Sorcerer 6.20
// www.as3sorcerer.com

//tails_fla.tailsitem_81

package tails_fla
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

    public dynamic class tailsitem_81 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var hand:MovieClip;
        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var itemBox:MovieClip;
        public var self:*;
        public var xframe:String;

        public function tailsitem_81()
        {
            addFrameScript(0, this.frame1, 4, this.frame5, 5, this.frame6, 8, this.frame9, 9, this.frame10, 12, this.frame13, 15, this.frame16, 22, this.frame23, 23, this.frame24, 26, this.frame27, 27, this.frame28, 29, this.frame30, 34, this.frame35, 44, this.frame45, 67, this.frame68, 81, this.frame82, 83, this.frame84, 87, this.frame88, 93, this.frame94, 94, this.frame95, 103, this.frame104);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            if ((((parent) && (SSF2API.isReady())) && (this.self)))
            {
                this.xframe = null;
            };
        }

        internal function frame5():*
        {
            this.self.endAttack();
        }

        internal function frame6():*
        {
            this.xframe = "charging";
        }

        internal function frame9():*
        {
            gotoAndPlay("fan2");
        }

        internal function frame10():*
        {
            this.xframe = "attack";
        }

        internal function frame13():*
        {
            this.self.endAttack();
        }

        internal function frame16():*
        {
            this.self.playAttackSound(1);
        }

        internal function frame23():*
        {
            this.self.endAttack();
        }

        internal function frame24():*
        {
            this.xframe = "charging";
        }

        internal function frame27():*
        {
            gotoAndPlay("beamsword2");
        }

        internal function frame28():*
        {
            this.xframe = "attack";
        }

        internal function frame30():*
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

        internal function frame35():*
        {
            this.self.endAttack();
        }

        internal function frame45():*
        {
            this.self.endAttack();
        }

        internal function frame68():*
        {
            this.self.endAttack();
        }

        internal function frame82():*
        {
            if (this.self.getItem() != null)
            {
                if (((this.self.getItem().getItemStat("linkage_id") == "energytank") && (this.self.getDamage() > 0)))
                {
                    this.gotoAndPlay("assistloop");
                };
            };
        }

        internal function frame84():*
        {
            this.self.endAttack();
        }

        internal function frame88():*
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

        internal function frame95():*
        {
            SSF2API.addEventListener(this.self, SSF2Event.GROUND_TOUCH, this.self.toLand);
        }

        internal function frame104():*
        {
            gotoAndPlay("cucco");
        }


    }
}//package tails_fla

