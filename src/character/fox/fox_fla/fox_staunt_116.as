// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//fox_fla.fox_staunt_116

package fox_fla
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

    public dynamic class fox_staunt_116 extends MovieClip 
    {

        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var hitBox4:MovieClip;
        public var hitBox5:MovieClip;
        public var itemBox:MovieClip;
        public var self:*;

        public function fox_staunt_116()
        {
            addFrameScript(0, this.frame1, 7, this.frame8, 26, this.frame27, 27, this.frame28);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            if ((((parent) && (SSF2API.isReady())) && (this.self)))
            {
                if ((((this.self.isCPU()) && (this.self.getCPULevel() >= 8)) && (SSF2API.random() >= 0.5)))
                {
                    this.gotoAndPlay("CPUTaunt");
                };
            };
        }

        internal function frame8():*
        {
            SSF2API.playSound("fox_hereICome");
            SSF2API.playSound("fox_firecharge");
        }

        internal function frame27():*
        {
            this.self.endAttack();
        }

        internal function frame28():*
        {
            this.self.importCPUControls([128, 2, 5441, 2, 128, 2, 5697, 2, 128, 2, 5441, 2, 128, 2, 5697, 2, 128, 2, 5441, 2, 128, 2, 5697, 2, 128, 2, 5441, 2, 128, 2, 5697, 2, 128, 2, 5441, 2, 128, 2, 5697, 2, 128, 2, 5441, 2, 128, 2, 5697, 1]);
        }


    }
}//package fox_fla

