// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//wario_fla.mario_swing_62

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

    public dynamic class mario_swing_62 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var hand:MovieClip;
        public var hitBox:MovieClip;
        public var itemBox:MovieClip;
        public var self:*;
        public var xframe:String;

        public function mario_swing_62()
        {
            addFrameScript(0, this.frame1, 3, this.frame4, 4, this.frame5, 7, this.frame8, 8, this.frame9, 11, this.frame12, 14, this.frame15, 23, this.frame24, 24, this.frame25, 25, this.frame26, 27, this.frame28, 28, this.frame29, 29, this.frame30, 40, this.frame41, 51, this.frame52, 82, this.frame83, 94, this.frame95, 96, this.frame97, 99, this.frame100, 107, this.frame108, 119, this.frame120);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            this.xframe = null;
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

        internal function frame41():*
        {
            this.self.endAttack();
        }

        internal function frame52():*
        {
            this.self.endAttack();
        }

        internal function frame83():*
        {
            this.self.endAttack();
        }

        internal function frame95():*
        {
            if (this.self.getItem() != null)
            {
                if (((this.self.getItem().getItemStat("linkage_id") == "energytank") && (this.self.getDamage() > 0)))
                {
                    this.gotoAndPlay("assistloop");
                };
            };
        }

        internal function frame97():*
        {
            this.self.endAttack();
        }

        internal function frame100():*
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

        internal function frame108():*
        {
            this.self.endAttack();
        }

        internal function frame120():*
        {
            gotoAndPlay("cuccoloop");
        }


    }
}//package wario_fla

