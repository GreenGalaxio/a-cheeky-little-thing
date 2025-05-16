// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//wario_fla.warioselect_91

package wario_fla
{
    import flash.display.MovieClip;
    import com.mcleodgaming.ssf2api.core.SSF2API;

    public dynamic class warioselect_91 extends MovieClip 
    {

        public var self:*;

        public function warioselect_91()
        {
            addFrameScript(0, this.frame1, 30, this.frame31);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
        }

        internal function frame31():*
        {
            gotoAndPlay("loop");
        }


    }
}//package wario_fla

