// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//yoshi_fla.Yoshi_item_55

package yoshi_fla
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

    public dynamic class Yoshi_item_55 extends MovieClip 
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

        public function Yoshi_item_55()
        {
            addFrameScript(0, this.frame1, 3, this.frame4, 4, this.frame5, 7, this.frame8, 8, this.frame9, 11, this.frame12, 14, this.frame15, 21, this.frame22, 22, this.frame23, 23, this.frame24, 28, this.frame29, 29, this.frame30, 31, this.frame32, 36, this.frame37, 46, this.frame47, 77, this.frame78, 92, this.frame93, 93, this.frame94, 98, this.frame99, 102, this.frame103, 103, this.frame104, 105, this.frame106);
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

        internal function frame15():*
        {
            this.self.playAttackSound(1);
        }

        internal function frame22():*
        {
            this.self.endAttack();
        }

        internal function frame23():*
        {
            this.xframe = null;
        }

        internal function frame24():*
        {
            this.xframe = "charging";
        }

        internal function frame29():*
        {
            gotoAndPlay("beamsword2_charge");
        }

        internal function frame30():*
        {
            this.xframe = "attack";
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

        internal function frame37():*
        {
            this.self.endAttack();
        }

        internal function frame47():*
        {
            this.self.endAttack();
        }

        internal function frame78():*
        {
            this.self.endAttack();
        }

        internal function frame93():*
        {
            if (this.self.getItem() != null)
            {
                if (((this.self.getItem().getItemStat("linkage_id") == "energytank") && (this.self.getDamage() > 0)))
                {
                    this.gotoAndPlay("assistloop");
                };
            };
        }

        internal function frame94():*
        {
            this.self.endAttack();
        }

        internal function frame99():*
        {
            if (this.self.getItem().getUses() <= this.self.getItem().getItemStat("uses_max"))
            {
                this.self.getItem().fireProjectile("bullet", 15, -30);
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

        internal function frame106():*
        {
            gotoAndPlay("cuccoloop");
        }


    }
}//package yoshi_fla

