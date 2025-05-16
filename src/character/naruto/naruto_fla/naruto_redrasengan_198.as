// Decompiled by AS3 Sorcerer 6.20
// www.as3sorcerer.com

//naruto_fla.naruto_redrasengan_198

package naruto_fla
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

    public dynamic class naruto_redrasengan_198 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var self:*;
        public var character:*;

        public function naruto_redrasengan_198()
        {
            addFrameScript(0, this.frame1, 1, this.frame2, 6, this.frame7, 12, this.frame13, 18, this.frame19, 24, this.frame25, 30, this.frame31, 35, this.frame36, 50, this.frame51, 51, this.frame52);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getProjectile(this);
            if (((SSF2API.isReady()) && (this.self)))
            {
                this.character = SSF2API.getCharacter(this.self.getID());
            };
        }

        internal function frame2():*
        {
        }

        internal function frame7():*
        {
            this.self.refreshAttackID();
        }

        internal function frame13():*
        {
            this.self.refreshAttackID();
        }

        internal function frame19():*
        {
            this.self.refreshAttackID();
        }

        internal function frame25():*
        {
            this.self.refreshAttackID();
        }

        internal function frame31():*
        {
            this.self.refreshAttackID();
        }

        internal function frame36():*
        {
            this.self.updateAttackBoxStats(1, {"kbConstant":80});
            this.self.refreshAttackID();
        }

        internal function frame51():*
        {
            stop();
        }

        internal function frame52():*
        {
            gotoAndStop("stopped");
        }


    }
}//package naruto_fla

