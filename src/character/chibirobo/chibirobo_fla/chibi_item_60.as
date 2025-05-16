// Decompiled by AS3 Sorcerer 6.20
// www.as3sorcerer.com

//chibirobo_fla.chibi_item_60

package chibirobo_fla
{
    import flash.display.MovieClip;
    import com.mcleodgaming.ssf2api.core.SSF2API;
    import com.mcleodgaming.ssf2api.core.SSF2Event;
    import flash.display.*;
    import flash.media.*;
    import flash.geom.*;
    import flash.events.*;
    import adobe.utils.*;
    import flash.accessibility.*;
    import flash.desktop.*;
    import flash.errors.*;
    import flash.external.*;
    import flash.filters.*;
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

    public dynamic class chibi_item_60 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var hitBox:MovieClip;
        public var itemBox:MovieClip;
        public var self:*;
        public var xframe:String;

        public function chibi_item_60()
        {
            addFrameScript(0, this.frame1, 3, this.frame4, 4, this.frame5, 7, this.frame8, 8, this.frame9, 11, this.frame12, 13, this.frame14, 23, this.frame24, 24, this.frame25, 25, this.frame26, 27, this.frame28, 28, this.frame29, 29, this.frame30, 31, this.frame32, 36, this.frame37, 48, this.frame49, 72, this.frame73, 73, this.frame74, 75, this.frame76, 88, this.frame89, 90, this.frame91, 95, this.frame96, 98, this.frame99);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            if ((((parent) && (SSF2API.isReady())) && (this.self)))
            {
                this.xframe = null;
            };
        }

        internal function frame4():*
        {
            this.self.endAttack();
        }

        internal function frame5():*
        {
            this.xframe = "charging";
        }

        internal function frame8():*
        {
            gotoAndPlay("fan2");
        }

        internal function frame9():*
        {
            this.xframe = "attack";
        }

        internal function frame12():*
        {
            this.self.endAttack();
        }

        internal function frame14():*
        {
            SSF2API.print("hey");
            this.self.playAttackSound(1);
        }

        internal function frame24():*
        {
            this.self.endAttack();
        }

        internal function frame25():*
        {
            this.xframe = null;
        }

        internal function frame26():*
        {
            this.xframe = "charging";
        }

        internal function frame28():*
        {
            gotoAndPlay("beamsword2_charge");
        }

        internal function frame29():*
        {
            this.xframe = "attack";
        }

        internal function frame30():*
        {
            this.self.playAttackSound(1);
        }

        internal function frame32():*
        {
            if (((this.self.getItem().getUses() <= this.self.getItem().getItemStat("uses_max")) && (this.self.getItem().getItemStat("linkage_id") == "starrod")))
            {
                this.self.getItem().fireProjectile("starrod_star");
                SSF2API.print(("Uses left: " + (this.self.getItem().getItemStat("uses_max") - this.self.getItem().getUses())));
                this.self.playAttackSound(1);
            }
            else
            {
                SSF2API.print("Star Rod is empty, firing failed!");
            };
        }

        internal function frame37():*
        {
            this.self.endAttack();
        }

        internal function frame49():*
        {
            this.self.endAttack();
        }

        internal function frame73():*
        {
            this.self.endAttack();
        }

        internal function frame74():*
        {
            SSF2API.addEventListener(this.self, SSF2Event.GROUND_TOUCH, this.self.toLand);
        }

        internal function frame76():*
        {
            gotoAndPlay("cucco_loop");
        }

        internal function frame89():*
        {
            if (this.self.getItem() != null)
            {
                if (((this.self.getItem().getItemStat("linkage_id") == "energytank") && (this.self.getDamage() > 0)))
                {
                    this.gotoAndPlay("assistloop");
                };
            };
        }

        internal function frame91():*
        {
            this.self.endAttack();
        }

        internal function frame96():*
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

        internal function frame99():*
        {
            this.self.endAttack();
        }


    }
}//package chibirobo_fla

