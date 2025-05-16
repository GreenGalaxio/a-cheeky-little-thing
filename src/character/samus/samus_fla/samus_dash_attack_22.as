// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//samus_fla.samus_dash_attack_22

package samus_fla
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

    public dynamic class samus_dash_attack_22 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var hitBox4:MovieClip;
        public var hitBox5:MovieClip;
        public var self:*;

        public function samus_dash_attack_22()
        {
            addFrameScript(0, this.frame1, 2, this.frame3, 13, this.frame14, 18, this.frame19);
        }

        internal function frame1():*
        {
            if (SSF2API.isReady())
            {
                this.self = SSF2API.getCharacter(this);
            };
        }

        internal function frame3():*
        {
            this.self.playAttackSound(1);
            this.self.setXSpeed(16, false);
        }

        internal function frame14():*
        {
            this.self.playAttackSound(1);
            this.self.setXSpeed(5, false);
        }

        internal function frame19():*
        {
            this.self.endAttack();
        }


    }
}//package samus_fla

