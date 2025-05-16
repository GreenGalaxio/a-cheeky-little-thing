// Decompiled by AS3 Sorcerer 6.20
// www.as3sorcerer.com

//goku_fla.ssgoku_dspecial_596

package goku_fla
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

    public dynamic class ssgoku_dspecial_596 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var self:*;
        public var finished:Boolean;
        public var xframe:String;
        public var cam:Object;

        public function ssgoku_dspecial_596()
        {
            addFrameScript(0, this.frame1, 8, this.frame9, 9, this.frame10, 101, this.frame102, 104, this.frame105, 115, this.frame116);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            if ((((parent) && (SSF2API.isReady())) && (this.self)))
            {
                this.finished = false;
                this.xframe = null;
            };
        }

        internal function frame9():*
        {
            this.cam = SSF2API.getCamBounds();
            this.self.getMC().x = (this.cam.x + (this.cam.width / 2));
            this.self.getMC().y = (this.cam.y + 200);
        }

        internal function frame10():*
        {
            this.self.playVoiceSound(1);
            this.self.playAttackSound(1);
        }

        internal function frame102():*
        {
            this.self.playAttackSound(2);
        }

        internal function frame105():*
        {
            this.self.fireProjectile("ssgoku_spiritbomb");
            SSF2API.shakeCamera(6);
        }

        internal function frame116():*
        {
            this.self.endFinalForm();
        }


    }
}//package goku_fla

