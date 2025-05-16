// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//ichigo_fla.ichigo_item_185

package ichigo_fla
{
    import flash.display.MovieClip;
    import com.mcleodgaming.ssf2api.core.SSF2API;
    import com.mcleodgaming.ssf2api.core.SSF2Event;
    import flash.display.*;
    import flash.events.*;
    import flash.media.*;
    import flash.geom.*;
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

    public dynamic class ichigo_item_185 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var hand:MovieClip;
        public var hitBox:MovieClip;
        public var itemBox:MovieClip;
        public var self:*;
        public var xframe:String;

        public function ichigo_item_185()
        {
            addFrameScript(0, this.frame1, 6, this.frame7, 7, this.frame8, 10, this.frame11, 11, this.frame12, 15, this.frame16, 18, this.frame19, 28, this.frame29, 29, this.frame30, 31, this.frame32, 34, this.frame35, 35, this.frame36, 37, this.frame38, 50, this.frame51, 60, this.frame61, 95, this.frame96, 99, this.frame100, 108, this.frame109, 109, this.frame110, 124, this.frame125, 135, this.frame136, 146, this.frame147);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            this.xframe = null;
        }

        internal function frame7():*
        {
            this.self.endAttack();
        }

        internal function frame8():*
        {
            this.xframe = "charging";
        }

        internal function frame11():*
        {
            gotoAndPlay("fan2");
        }

        internal function frame12():*
        {
            this.xframe = "attack";
        }

        internal function frame16():*
        {
            this.self.endAttack();
        }

        internal function frame19():*
        {
            this.self.playAttackSound(1);
        }

        internal function frame29():*
        {
            this.self.endAttack();
        }

        internal function frame30():*
        {
            this.xframe = null;
        }

        internal function frame32():*
        {
            this.xframe = "charging";
        }

        internal function frame35():*
        {
            gotoAndPlay("beamsword2_charge");
        }

        internal function frame36():*
        {
            this.xframe = "attack";
        }

        internal function frame38():*
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

        internal function frame61():*
        {
            this.self.endAttack();
        }

        internal function frame96():*
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

        internal function frame109():*
        {
            this.self.endAttack();
        }

        internal function frame110():*
        {
            SSF2API.addEventListener(this.self, SSF2Event.GROUND_TOUCH, this.self.toLand);
        }

        internal function frame125():*
        {
            this.gotoAndPlay("cuccoloop");
        }

        internal function frame136():*
        {
            if (this.self.getItem() != null)
            {
                if (((this.self.getItem().getItemStat("linkage_id") == "energytank") && (this.self.getDamage() > 0)))
                {
                    this.gotoAndPlay("assistloop");
                };
            };
        }

        internal function frame147():*
        {
            this.self.endAttack();
        }


    }
}//package ichigo_fla

