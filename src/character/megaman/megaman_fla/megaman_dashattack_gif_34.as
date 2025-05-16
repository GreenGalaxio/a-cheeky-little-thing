// Decompiled by AS3 Sorcerer 6.20
// www.as3sorcerer.com

//megaman_fla.megaman_dashattack_gif_34

package megaman_fla
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

    public dynamic class megaman_dashattack_gif_34 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var self:*;

        public function megaman_dashattack_gif_34()
        {
            addFrameScript(0, this.frame1, 6, this.frame7, 12, this.frame13, 13, this.frame14);
        }

        public function moveForward():void
        {
            this.self.setXSpeed(10, false);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            if ((((parent) && (SSF2API.isReady())) && (this.self)))
            {
                this.self.playAttackSound(1);
                this.self.attachEffect("megaman_dashsmoke");
                SSF2API.createTimer(this.self, 1, -1, this.moveForward);
            };
        }

        internal function frame7():*
        {
            this.self.updateAttackBoxStats(1, {
                "damage":7,
                "kbConstant":30
            });
        }

        internal function frame13():*
        {
            SSF2API.destroyTimer(this.self, this.moveForward);
            this.self.resetMovement();
        }

        internal function frame14():*
        {
            this.self.endAttack();
        }


    }
}//package megaman_fla

