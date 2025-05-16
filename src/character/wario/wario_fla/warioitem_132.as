// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//wario_fla.warioitem_132

package wario_fla
{
    import flash.display.MovieClip;
    import com.mcleodgaming.ssf2api.core.SSF2API;
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

    public dynamic class warioitem_132 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var hitBox:MovieClip;
        public var itemBox:MovieClip;
        public var self:*;
        public var xframe:String;

        public function warioitem_132()
        {
            addFrameScript(0, this.frame1, 4, this.frame5, 5, this.frame6, 8, this.frame9, 9, this.frame10, 12, this.frame13, 16, this.frame17, 27, this.frame28, 42, this.frame43, 43, this.frame44, 44, this.frame45, 47, this.frame48, 48, this.frame49, 51, this.frame52, 59, this.frame60, 84, this.frame85, 87, this.frame88, 93, this.frame94, 108, this.frame109, 110, this.frame111, 125, this.frame126);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            this.xframe = null;
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

        internal function frame17():*
        {
            this.self.playAttackSound(1);
        }

        internal function frame28():*
        {
            this.self.endAttack();
        }

        internal function frame43():*
        {
            this.self.endAttack();
        }

        internal function frame44():*
        {
            this.xframe = null;
        }

        internal function frame45():*
        {
            this.xframe = "charging";
        }

        internal function frame48():*
        {
            gotoAndPlay("beamsword2_charge");
        }

        internal function frame49():*
        {
            this.xframe = "attack";
        }

        internal function frame52():*
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

        internal function frame60():*
        {
            this.self.endAttack();
        }

        internal function frame85():*
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

        internal function frame111():*
        {
            this.self.endAttack();
        }

        internal function frame126():*
        {
            gotoAndPlay("cuccoloop");
        }


    }
}//package wario_fla

