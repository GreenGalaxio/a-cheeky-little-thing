// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//mario_fla.mario_capespin_168

package mario_fla
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

    public dynamic class mario_capespin_168 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var hitBox4:MovieClip;
        public var hitBox:MovieClip;
        public var hand:MovieClip;
        public var attackBox2:MovieClip;
        public var self:*;
        public var gliding:Boolean;

        public function mario_capespin_168()
        {
            addFrameScript(0, this.frame1, 2, this.frame3, 5, this.frame6, 18, this.frame19);
        }

        public function glideAway(_arg_1:*=null):*
        {
            this.self.setXSpeed(9, false);
            SSF2API.print("gliding");
            this.self.updateAttackStats({
                "air_ease":0,
                "xSpeedDecayAir":-0.4,
                "xSpeedDecay":-0.2,
                "allowControl":true
            });
            this.gliding = true;
            SSF2API.removeEventListener(this.self, SSF2Event.GROUND_LEAVE, this.glideAway);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            this.gliding = false;
            if (SSF2API.isReady())
            {
                if (this.self.isOnGround())
                {
                    SSF2API.addEventListener(this.self, SSF2Event.GROUND_LEAVE, this.glideAway);
                };
            };
        }

        internal function frame3():*
        {
            SSF2API.removeEventListener(this.self, SSF2Event.GROUND_LEAVE, this.glideAway);
        }

        internal function frame6():*
        {
            SSF2API.playSound("mario_cape");
            if (((!(this.gliding)) && (!(this.self.isOnGround()))))
            {
                this.self.unnattachFromGround();
                this.self.setYSpeed(-4);
            };
            this.self.refreshAttackID();
        }

        internal function frame19():*
        {
            this.self.endAttack();
        }


    }
}//package mario_fla

