// Decompiled by AS3 Sorcerer 6.20
// www.as3sorcerer.com

//goku_fla.ssgoku_dspecialprojectilecopy_2

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

    public dynamic class ssgoku_dspecialprojectilecopy_2 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var hitBox:MovieClip;
        public var self:*;
        public var character:*;
        public var charge:Number;
        public var transformMatrix:*;

        public function ssgoku_dspecialprojectilecopy_2()
        {
            addFrameScript(0, this.frame1, 1, this.frame2, 3, this.frame4, 20, this.frame21, 21, this.frame22);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getProjectile(this);
            if (((SSF2API.isReady()) && (this.self)))
            {
                this.character = SSF2API.getCharacter(this.self.getID());
            };
            if (((SSF2API.isReady()) && (this.self)))
            {
                this.charge = 0;
            };
        }

        internal function frame2():*
        {
            if (this.charge < 2.65)
            {
                this.transformMatrix = this.transform.matrix;
                this.transformMatrix.a = (this.transformMatrix.a + 0.02);
                this.transformMatrix.d = (this.transformMatrix.d + 0.02);
            };
            this.charge = (this.charge + 0.02);
        }

        internal function frame4():*
        {
            this.self.refreshAttackID();
            this.gotoAndPlay("bomb");
        }

        internal function frame21():*
        {
            gotoAndStop("end");
        }

        internal function frame22():*
        {
            this.self.endAttack();
        }


    }
}//package goku_fla

