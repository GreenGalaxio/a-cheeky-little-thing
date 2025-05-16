// Decompiled by AS3 Sorcerer 6.20
// www.as3sorcerer.com

//marth_fla.marth_item_140

package marth_fla
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

    public dynamic class marth_item_140 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var itemBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var hitBox4:MovieClip;
        public var hitBox5:MovieClip;
        public var hitBox:MovieClip;
        public var self:*;
        public var xframe:String;

        public function marth_item_140()
        {
            addFrameScript(0, this.frame1, 11, this.frame12, 12, this.frame13, 15, this.frame16, 16, this.frame17, 26, this.frame27, 31, this.frame32, 40, this.frame41, 43, this.frame44, 45, this.frame46, 46, this.frame47, 48, this.frame49, 49, this.frame50, 56, this.frame57, 67, this.frame68, 98, this.frame99, 101, this.frame102, 108, this.frame109, 109, this.frame110, 120, this.frame121, 135, this.frame136, 136, this.frame137);
        }

        internal function frame1():*
        {
            if (SSF2API.isReady())
            {
                this.self = SSF2API.getCharacter(this);
            };
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

        internal function frame32():*
        {
            this.self.playAttackSound(1);
        }

        internal function frame41():*
        {
            this.self.endAttack();
        }

        internal function frame44():*
        {
            this.xframe = "charging";
        }

        internal function frame46():*
        {
            gotoAndPlay("beamsword2_charge");
        }

        internal function frame47():*
        {
            this.xframe = "attack";
        }

        internal function frame49():*
        {
            this.self.playAttackSound(1);
        }

        internal function frame50():*
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

        internal function frame57():*
        {
            this.self.endAttack();
        }

        internal function frame68():*
        {
            this.self.endAttack();
        }

        internal function frame99():*
        {
            this.self.endAttack();
        }

        internal function frame102():*
        {
            if (this.self.getItem().getUses() <= this.self.getItem().getItemStat("uses_max"))
            {
                this.self.getItem().fireProjectile("bullet", 30, -30);
                this.self.playAttackSound(1);
            }
            else
            {
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

        internal function frame121():*
        {
            gotoAndPlay("cuccoloop");
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

        internal function frame137():*
        {
            this.self.endAttack();
        }


    }
}//package marth_fla

