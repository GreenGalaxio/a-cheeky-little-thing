// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//ichigo_fla.getsuga2_233

package ichigo_fla
{
    import flash.display.MovieClip;
    import com.mcleodgaming.ssf2api.core.SSF2API;

    public dynamic class getsuga2_233 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var hitBox:MovieClip;
        public var self:*;

        public function getsuga2_233()
        {
            addFrameScript(0, this.frame1, 18, this.frame19);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getProjectile(this);
        }

        internal function frame19():*
        {
            gotoAndPlay("repeat");
        }


    }
}//package ichigo_fla

