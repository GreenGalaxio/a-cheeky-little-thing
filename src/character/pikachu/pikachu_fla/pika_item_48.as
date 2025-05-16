// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//pikachu_fla.pika_item_48

package pikachu_fla
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

    public dynamic class pika_item_48 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var hand:MovieClip;
        public var hitBox:MovieClip;
        public var itemBox:MovieClip;
        public var self:*;
        public var xframe:String;

        public function pika_item_48()
        {
            addFrameScript(0, this.frame1, 3, this.frame4, 4, this.frame5, 7, this.frame8, 8, this.frame9, 11, this.frame12, 12, this.frame13, 25, this.frame26, 26, this.frame27, 28, this.frame29, 31, this.frame32, 32, this.frame33, 34, this.frame35, 51, this.frame52, 64, this.frame65, 105, this.frame106, 115, this.frame116, 123, this.frame124, 127, this.frame128, 132, this.frame133, 133, this.frame134, 138, this.frame139);
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

        internal function frame13():*
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
            stop();
        }

        internal function frame32():*
        {
            gotoAndPlay("beamsword2_charge");
        }

        internal function frame33():*
        {
            this.xframe = "attack";
        }

        internal function frame35():*
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

        internal function frame52():*
        {
            this.self.endAttack();
        }

        internal function frame65():*
        {
            if (((!(root == null)) && (!(parent == null))))
            {
                this.self.endAttack();
            };
        }

        internal function frame106():*
        {
            this.self.endAttack();
        }

        internal function frame116():*
        {
            if (this.self.getItem() != null)
            {
                if (((this.self.getItem().getItemStat("linkage_id") == "energytank") && (this.self.getDamage() > 0)))
                {
                    this.gotoAndPlay("assistloop");
                };
            };
        }

        internal function frame124():*
        {
            this.self.endAttack();
        }

        internal function frame128():*
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

        internal function frame133():*
        {
            this.self.endAttack();
        }

        internal function frame134():*
        {
            SSF2API.addEventListener(this.self, SSF2Event.GROUND_TOUCH, this.self.toLand);
        }

        internal function frame139():*
        {
            gotoAndPlay("cuccoloop");
        }


    }
}//package pikachu_fla

