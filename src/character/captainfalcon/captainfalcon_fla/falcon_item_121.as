// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//captainfalcon_fla.falcon_item_121

package captainfalcon_fla
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

    public dynamic class falcon_item_121 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var ikNode_1:MovieClip;
        public var itemBox:MovieClip;
        public var xframe:String;
        public var self:*;

        public function falcon_item_121()
        {
            addFrameScript(0, this.frame1, 4, this.frame5, 5, this.frame6, 10, this.frame11, 11, this.frame12, 15, this.frame16, 18, this.frame19, 25, this.frame26, 26, this.frame27, 28, this.frame29, 33, this.frame34, 34, this.frame35, 36, this.frame37, 49, this.frame50, 52, this.frame53, 58, this.frame59, 91, this.frame92, 95, this.frame96, 98, this.frame99, 113, this.frame114, 115, this.frame116, 126, this.frame127);
        }

        internal function frame1():*
        {
            this.xframe = null;
            if (SSF2API.isReady())
            {
                this.self = SSF2API.getCharacter(this);
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

        internal function frame26():*
        {
            this.self.endAttack();
        }

        internal function frame27():*
        {
            this.xframe = null;
        }

        internal function frame29():*
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

        internal function frame53():*
        {
            this.self.playAttackSound(1);
        }

        internal function frame59():*
        {
            this.self.endAttack();
        }

        internal function frame92():*
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

        internal function frame114():*
        {
            if (this.self.getItem() != null)
            {
                if (((this.self.getItem().getItemStat("linkage_id") == "energytank") && (this.self.getDamage() > 0)))
                {
                    this.gotoAndPlay("assistloop");
                };
            };
        }

        internal function frame116():*
        {
            this.self.endAttack();
        }

        internal function frame127():*
        {
            gotoAndPlay("cuccoloop");
        }


    }
}//package captainfalcon_fla

