// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//kirby_fla.kirby_tails_205

package kirby_fla
{
    import flash.display.MovieClip;
    import com.mcleodgaming.ssf2api.core.SSF2API;
    import com.mcleodgaming.ssf2api.core.SSF2Event;
    import flash.geom.*;
    import flash.display.*;
    import flash.events.*;
    import flash.utils.*;
    import flash.media.*;
    import flash.filters.*;
    import adobe.utils.*;
    import flash.accessibility.*;
    import flash.desktop.*;
    import flash.errors.*;
    import flash.external.*;
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
    import flash.xml.*;

    public dynamic class kirby_tails_205 extends MovieClip 
    {

        public var hatBox:MovieClip;
        public var hitBox:MovieClip;
        public var self:*;
        public var tails_ground:Boolean;

        public function kirby_tails_205()
        {
            addFrameScript(0, this.frame1, 6, this.frame7, 12, this.frame13, 27, this.frame28, 28, this.frame29, 31, this.frame32, 37, this.frame38, 54, this.frame55);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            if ((((parent) && (SSF2API.isReady())) && (this.self)))
            {
                this.tails_ground = this.self.isOnGround();
                if (!this.tails_ground)
                {
                    gotoAndPlay("tails_air");
                };
            };
        }

        internal function frame7():*
        {
            this.self.playVoiceSound(1);
        }

        internal function frame13():*
        {
            this.self.fireProjectile("tails_cannon");
            this.self.playAttackSound(1);
        }

        internal function frame28():*
        {
            this.self.endAttack();
        }

        internal function frame29():*
        {
            SSF2API.addEventListener(this.self, SSF2Event.GROUND_TOUCH, this.self.toLand);
        }

        internal function frame32():*
        {
            this.self.playVoiceSound(1);
        }

        internal function frame38():*
        {
            this.self.fireProjectile("tails_cannon_air");
            this.self.playAttackSound(1);
            this.self.updateAttackStats({"allowControl":false});
            this.self.setXSpeed(-6, false);
            this.self.setYSpeed(-6);
        }

        internal function frame55():*
        {
            this.self.endAttack();
        }


    }
}//package kirby_fla

