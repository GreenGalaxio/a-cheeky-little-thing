// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//ichigo_fla.ichigo_slasher_special_31

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

    public dynamic class ichigo_slasher_special_31 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var hand:MovieClip;
        public var hitBox:MovieClip;
        public var self:*;

        public function ichigo_slasher_special_31()
        {
            addFrameScript(0, this.frame1, 3, this.frame4, 5, this.frame6, 7, this.frame8, 9, this.frame10, 11, this.frame12, 13, this.frame14, 15, this.frame16, 17, this.frame18, 19, this.frame20, 21, this.frame22, 23, this.frame24, 25, this.frame26, 27, this.frame28, 28, this.frame29, 30, this.frame31, 52, this.frame53);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            if ((((parent) && (SSF2API.isReady())) && (this.self)))
            {
                this.self.playVoiceSound("attackVoice1");
            };
        }

        internal function frame4():*
        {
            this.self.playAttackSound(1);
        }

        internal function frame6():*
        {
            this.self.playAttackSound(1);
        }

        internal function frame8():*
        {
            this.self.playAttackSound(1);
        }

        internal function frame10():*
        {
            this.self.playAttackSound(1);
        }

        internal function frame12():*
        {
            this.self.playAttackSound(1);
        }

        internal function frame14():*
        {
            this.self.playAttackSound(1);
        }

        internal function frame16():*
        {
            this.self.playAttackSound(1);
        }

        internal function frame18():*
        {
            this.self.playAttackSound(1);
        }

        internal function frame20():*
        {
            this.self.playAttackSound(1);
        }

        internal function frame22():*
        {
            this.self.playAttackSound(1);
        }

        internal function frame24():*
        {
            this.self.playAttackSound(1);
        }

        internal function frame26():*
        {
            this.self.playAttackSound(1);
        }

        internal function frame28():*
        {
            this.self.playAttackSound(1);
            this.self.refreshAttackID();
            this.self.updateAttackBoxStats(1, {
                "power":60,
                "direction":65,
                "damage":6
            });
        }

        internal function frame29():*
        {
            this.self.playAttackSound(2);
        }

        internal function frame31():*
        {
            this.self.updateAttackBoxStats(1, {"power":70});
        }

        internal function frame53():*
        {
            this.self.endAttack();
        }


    }
}//package ichigo_fla

