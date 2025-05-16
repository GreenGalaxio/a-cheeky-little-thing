// Decompiled by AS3 Sorcerer 6.20
// www.as3sorcerer.com

//link_fla.link_new_fsmash_34

package link_fla
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

    public dynamic class link_new_fsmash_34 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var hitBox4:MovieClip;
        public var hitBox5:MovieClip;
        public var hitBox6:MovieClip;
        public var self:*;
        public var xframe:String;
        public var continuePlaying:Boolean;
        public var handled:Boolean;

        public function link_new_fsmash_34()
        {
            addFrameScript(0, this.frame1, 4, this.frame5, 9, this.frame10, 10, this.frame11, 12, this.frame13, 14, this.frame15, 15, this.frame16, 17, this.frame18, 18, this.frame19, 19, this.frame20, 20, this.frame21, 21, this.frame22, 22, this.frame23, 23, this.frame24, 24, this.frame25, 25, this.frame26, 26, this.frame27, 27, this.frame28, 28, this.frame29, 31, this.frame32, 34, this.frame35, 36, this.frame37, 48, this.frame49);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            this.xframe = null;
            if ((((parent) && (SSF2API.isReady())) && (this.self)))
            {
                this.self.setGlobalVariable("nStoredLabel", null);
                this.self.setGlobalVariable("sStoredLabel", null);
            };
        }

        internal function frame5():*
        {
            this.xframe = "charging";
        }

        internal function frame10():*
        {
            this.gotoAndPlay("charging");
        }

        internal function frame11():*
        {
            this.continuePlaying = false;
            this.handled = true;
            this.xframe = "attack";
        }

        internal function frame13():*
        {
            this.self.setXSpeed(17.5, false);
        }

        internal function frame15():*
        {
            this.continuePlaying = false;
            this.handled = false;
            this.self.playAttackSound(1);
        }

        internal function frame16():*
        {
            this.self.setXSpeed(0, false);
        }

        internal function frame18():*
        {
            if (this.continuePlaying == true)
            {
                gotoAndPlay("combo2");
            };
        }

        internal function frame19():*
        {
            if (this.continuePlaying == true)
            {
                gotoAndPlay("combo2");
            };
        }

        internal function frame20():*
        {
            if (this.continuePlaying == true)
            {
                gotoAndPlay("combo2");
            };
        }

        internal function frame21():*
        {
            if (this.continuePlaying == true)
            {
                gotoAndPlay("combo2");
            };
        }

        internal function frame22():*
        {
            if (this.continuePlaying == true)
            {
                gotoAndPlay("combo2");
            };
        }

        internal function frame23():*
        {
            if (this.continuePlaying == true)
            {
                gotoAndPlay("combo2");
            };
        }

        internal function frame24():*
        {
            if (this.continuePlaying == true)
            {
                gotoAndPlay("combo2");
            };
        }

        internal function frame25():*
        {
            if (this.continuePlaying == true)
            {
                gotoAndPlay("combo2");
            };
        }

        internal function frame26():*
        {
            if (this.continuePlaying == true)
            {
                gotoAndPlay("combo2");
            };
        }

        internal function frame27():*
        {
            if (this.continuePlaying == true)
            {
                gotoAndPlay("combo2");
            };
        }

        internal function frame28():*
        {
            this.self.endAttack();
        }

        internal function frame29():*
        {
            this.self.updateAttackBoxStats(1, {
                "damage":14,
                "direction":48,
                "power":35,
                "hitStun":2,
                "selfHitStun":4,
                "effectSound":"sw_brawl_hit_H"
            });
            this.self.refreshAttackID();
        }

        internal function frame32():*
        {
            this.self.playVoiceSound(1);
            this.self.setXSpeed(17.5, false);
        }

        internal function frame35():*
        {
            this.self.playVoiceSound(2);
            this.self.playAttackSound(2);
        }

        internal function frame37():*
        {
            this.self.setXSpeed(0, false);
        }

        internal function frame49():*
        {
            this.self.endAttack();
        }


    }
}//package link_fla

