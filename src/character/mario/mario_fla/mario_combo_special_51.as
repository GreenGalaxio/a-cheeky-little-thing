// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//mario_fla.mario_combo_special_51

package mario_fla
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

    public dynamic class mario_combo_special_51 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var hitBox:MovieClip;
        public var self:*;
        public var continuePlaying:Boolean;
        public var handled:Boolean;
        public var restart:Boolean;
        public var playsound:Number;
        public var audio:Number;

        public function mario_combo_special_51()
        {
            addFrameScript(0, this.frame1, 1, this.frame2, 6, this.frame7, 11, this.frame12, 12, this.frame13, 14, this.frame15, 15, this.frame16, 19, this.frame20, 20, this.frame21, 22, this.frame23, 36, this.frame37, 41, this.frame42, 42, this.frame43, 48, this.frame49, 61, this.frame62);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            if ((((parent) && (SSF2API.isReady())) && (this.self)))
            {
                this.continuePlaying = false;
                this.handled = true;
                this.restart = false;
            };
            if ((((parent) && (SSF2API.isReady())) && (this.self)))
            {
                this.playsound = SSF2API.random();
                this.audio = this.self.getGlobalVariable("audio");
            };
        }

        internal function frame2():*
        {
            SSF2API.playSound("mario_grunt2");
            SSF2API.playSound("brawl_swing_s");
        }

        internal function frame7():*
        {
            this.continuePlaying = false;
            this.handled = false;
        }

        internal function frame12():*
        {
            if (((!(this.continuePlaying == true)) && (!(this.restart))))
            {
                this.self.endAttack();
            }
            else
            {
                if (this.restart)
                {
                    gotoAndPlay("begin");
                };
            };
        }

        internal function frame13():*
        {
            this.self.refreshAttackID();
        }

        internal function frame15():*
        {
            SSF2API.playSound("mario_grunt2");
            SSF2API.playSound("brawl_swing_s");
        }

        internal function frame16():*
        {
            this.continuePlaying = false;
            this.handled = false;
        }

        internal function frame20():*
        {
            if (((!(this.continuePlaying == true)) && (!(this.restart))))
            {
                this.self.endAttack();
            }
            else
            {
                if (this.restart)
                {
                    gotoAndPlay("begin");
                };
            };
        }

        internal function frame21():*
        {
            this.self.refreshAttackID();
            this.self.modifyAttackPower(0);
            this.self.modifyHitLag(-1);
            this.self.modifyHitStun(15);
        }

        internal function frame23():*
        {
            SSF2API.playSound("mario_grunt4");
            SSF2API.playSound("brawl_swing_l");
        }

        internal function frame37():*
        {
            this.continuePlaying = false;
            this.handled = false;
        }

        internal function frame42():*
        {
            if (((!(this.continuePlaying == true)) && (!(this.restart))))
            {
                this.self.endAttack();
            }
            else
            {
                if (this.restart)
                {
                    gotoAndPlay("begin");
                };
            };
        }

        internal function frame43():*
        {
            this.self.refreshAttackID();
            this.self.modifyHitLag(-1);
            this.self.modifyKBConstant(100);
            this.self.modifyAttackPower(75);
        }

        internal function frame49():*
        {
            SSF2API.playSound("mario_ha");
            SSF2API.playSound("fsmash_sfx");
        }

        internal function frame62():*
        {
            this.self.endAttack();
        }


    }
}//package mario_fla

