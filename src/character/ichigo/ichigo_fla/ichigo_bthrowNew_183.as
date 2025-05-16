// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//ichigo_fla.ichigo_bthrowNew_183

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

    public dynamic class ichigo_bthrowNew_183 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var hitBox4:MovieClip;
        public var hitBox5:MovieClip;
        public var hitBox6:MovieClip;
        public var hitBox7:MovieClip;
        public var touchBox:MovieClip;
        public var self:*;

        public function ichigo_bthrowNew_183()
        {
            addFrameScript(0, this.frame1, 4, this.frame5, 13, this.frame14, 14, this.frame15, 23, this.frame24);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
        }

        internal function frame5():*
        {
            this.self.playVoiceSound(1);
            this.self.playAttackSound(1);
            SSF2API.shakeCamera(9);
        }

        internal function frame14():*
        {
            this.self.updateAttackBoxStats(1, {
                "hasEffect":true,
                "effectSound":"sw_scratch"
            });
            this.self.refreshAttackID();
        }

        internal function frame15():*
        {
            this.self.playVoiceSound(2);
            this.self.playAttackSound(2);
            this.self.updateAttackBoxStats(1, {
                "hasEffect":true,
                "damage":6,
                "effect_id":"effect_swordSlash"
            });
        }

        internal function frame24():*
        {
            this.self.endAttack();
        }


    }
}//package ichigo_fla

