// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//zamus_fla.zamus_spec_up_36

package zamus_fla
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

    public dynamic class zamus_spec_up_36 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var hitBox4:MovieClip;
        public var self:*;

        public function zamus_spec_up_36()
        {
            addFrameScript(0, this.frame1, 5, this.frame6, 7, this.frame8, 11, this.frame12, 17, this.frame18);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            if (((parent) && (SSF2API.isReady())))
            {
                this.self.setGlobalVariable("tether", false);
            };
        }

        internal function frame6():*
        {
            this.self.playAttackSound(1);
        }

        internal function frame8():*
        {
            this.self.refreshAttackID();
            this.self.updateAttackBoxStats(1, {
                "direction":110,
                "hitStun":5,
                "power":70
            });
        }

        internal function frame12():*
        {
            this.self.refreshAttackID();
            this.self.updateAttackBoxStats(1, {
                "reversableAngle":true,
                "direction":270,
                "hitStun":2,
                "power":30,
                "kbConstant":80
            });
        }

        internal function frame18():*
        {
            this.self.endAttack();
        }


    }
}//package zamus_fla

