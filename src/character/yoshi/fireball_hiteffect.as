// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//fireball_hiteffect

package 
{
    import flash.display.MovieClip;

    public dynamic class fireball_hiteffect extends MovieClip 
    {

        public function fireball_hiteffect()
        {
            addFrameScript(16, this.frame17);
        }

        internal function frame17():*
        {
            if (parent != null)
            {
                parent.removeChild(this);
            };
        }


    }
}//package 

