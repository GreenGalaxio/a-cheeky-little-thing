// Decompiled by AS3 Sorcerer 6.20
// www.as3sorcerer.com

//naruto_fla.naruto_downair_special_55

package naruto_fla
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

    public dynamic class naruto_downair_special_55 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var hand:MovieClip;
        public var hitBox:MovieClip;
        public var self:*;

        public function naruto_downair_special_55()
        {
            addFrameScript(0, this.frame1, 3, this.frame4, 7, this.frame8, 25, this.frame26, 33, this.frame34);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            if ((((parent) && (SSF2API.isReady())) && (this.self)))
            {
                SSF2API.addEventListener(this.self, SSF2Event.GROUND_TOUCH, this.self.toIdle);
            };
        }

        internal function frame4():*
        {
            this.self.playVoiceSound(1);
            this.self.playAttackSound(1);
            this.self.setXSpeed(7, false);
            this.self.setYSpeed(36);
        }

        internal function frame8():*
        {
            this.self.updateAttackStats({
                "allowDoubleJump":true,
                "doubleJumpCancelAttack":true,
                "allowFullInterrupt":true
            });
        }

        internal function frame26():*
        {
            this.self.endAttack();
        }

        internal function frame34():*
        {
            this.self.endAttack();
        }


    }
}//package naruto_fla

