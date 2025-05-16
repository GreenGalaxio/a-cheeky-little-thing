// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//ichigo_fla.ichigo_attackforward_special_18

package ichigo_fla
{
    import flash.display.MovieClip;
    import com.mcleodgaming.ssf2api.core.SSF2API;
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

    public dynamic class ichigo_attackforward_special_18 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var hand:MovieClip;
        public var hitBox:MovieClip;
        public var self:*;
        public var continuePlaying:Boolean;
        public var handled:Boolean;
        public var restart:Boolean;

        public function ichigo_attackforward_special_18()
        {
            addFrameScript(0, this.frame1, 8, this.frame9, 12, this.frame13, 13, this.frame14, 17, this.frame18, 20, this.frame21, 21, this.frame22, 24, this.frame25, 46, this.frame47);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            if ((((parent) && (SSF2API.isReady())) && (this.self)))
            {
                this.continuePlaying = false;
                this.handled = true;
                this.restart = false;
                this.self.playVoiceSound(1);
                this.self.playAttackSound(1);
            };
        }

        internal function frame9():*
        {
            this.continuePlaying = false;
            this.handled = false;
        }

        internal function frame13():*
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

        internal function frame14():*
        {
            this.self.refreshAttackID();
            this.self.playVoiceSound(2);
            this.self.playAttackSound(2);
        }

        internal function frame18():*
        {
            this.continuePlaying = false;
            this.handled = false;
        }

        internal function frame21():*
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

        internal function frame22():*
        {
            this.self.refreshAttackID();
            this.self.playVoiceSound(3);
            this.self.playAttackSound(1);
            this.self.updateAttackBoxStats(1, {
                "power":40,
                "direction":30,
                "damage":6
            });
        }

        internal function frame25():*
        {
            this.self.updateAttackStats({"xSpeedDecay":-1});
            this.self.setXSpeed(10, false);
        }

        internal function frame47():*
        {
            this.self.endAttack();
        }


    }
}//package ichigo_fla

