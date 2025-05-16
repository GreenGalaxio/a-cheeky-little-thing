// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//sonic_fla.sonic_flying_new_175

package sonic_fla
{
    import flash.display.MovieClip;
    import com.mcleodgaming.ssf2api.core.SSF2API;

    public dynamic class sonic_flying_new_175 extends MovieClip 
    {

        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var itemBox:MovieClip;
        public var self:*;

        public function sonic_flying_new_175()
        {
            addFrameScript(0, this.frame1);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
        }


    }
}//package sonic_fla

